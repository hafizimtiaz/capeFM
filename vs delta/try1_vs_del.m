clear; clc; close all

% load data
filepath = '../Datasets/';
filename = 'synth_D_20_N_20000.mat';
load([filepath, filename]);

% solve using regular optimization
mu = 0.0; % regularizer
loss = @(w) (1/N) * norm(y - X * w)^2 + mu * norm(w)^2;
lb = - 1 * ones(D,1);
ub = 1 * ones(D,1);
A = []; b = []; Aeq = []; beq = [];
w_init = ones(D,1); w_init = w_init / norm(w_init);
opts = optimoptions(@fmincon,'Display','off', 'Algorithm', 'interior-point');
[~, loss_opt] = fmincon(loss, w_init, A, b, Aeq, beq, lb, ub, [], opts)

% test the functional approach without noise
lambda_1 = (1/N) * sumsqr(y);
lambda_w = (-2/N) * sum(diag(y) * X); lambda_w = lambda_w';
lambda_ww = (1/N) * (X' * X);
loss_fm = @(w) lambda_1 + w' * lambda_w + trace((w * w') * lambda_ww) + mu * norm(w)^2;
[~, loss_opt_fm] = fmincon(loss_fm, w_init, A, b, Aeq, beq, lb, ub, [], opts)

% test the dp-functional approach with the improved one
numItr = 20; FS = 24;
epsilon = 1;
delta_all = [1e-6, 5e-6, 1e-5, 5e-5, 1e-4, 5e-4, 1e-3, 5e-3, 1e-2, 5e-2]';
S = 5; % number of sites

loss_opt_np = zeros(numItr, length(delta_all));
loss_opt_cape = zeros(numItr, length(delta_all));
loss_opt_conv = zeros(numItr, length(delta_all));
loss_opt_local = zeros(numItr, length(delta_all));
loss_opt_exst = zeros(numItr, length(delta_all));

errW_np = zeros(numItr, length(delta_all));
errW_cape = zeros(numItr, length(delta_all));
errW_conv = zeros(numItr, length(delta_all));
errW_local = zeros(numItr, length(delta_all));
errW_exst = zeros(numItr, length(delta_all));


for itr = 1:numItr
    for del_id = 1:length(delta_all)
        delta = delta_all(del_id);

        [w_opt_np, loss_opt_np(itr, del_id), w_opt_cape, loss_opt_cape(itr, del_id), ...
            w_opt_conv, loss_opt_conv(itr, del_id), w_opt_local, loss_opt_local(itr, del_id),...
            w_opt_exst, loss_opt_exst(itr, del_id)] = myLinReg(X, y, mu, S, epsilon, delta);
        
        errW_np(itr, del_id) = (1/D) * norm(beta - w_opt_np);
        errW_cape(itr, del_id) = (1/D) * norm(beta - w_opt_cape);
        errW_conv(itr, del_id) = (1/D) * norm(beta - w_opt_conv);
        errW_local(itr, del_id) = (1/D) * norm(beta - w_opt_local);
        errW_exst(itr, del_id) = (1/D) * norm(beta - w_opt_exst);
    end
end
save(['results_vs_delta_synth_D_',num2str(D),'_N_',num2str(N),'_eps_1'],...
        'loss_opt_np', 'loss_opt_cape', 'loss_opt_conv', 'loss_opt_local', ...
        'loss_opt_exst', 'errW_np', 'errW_cape', 'errW_conv', 'errW_local', ...
        'errW_exst', 'delta_all', 'epsilon', 'S', 'mu')
% loglog(delta_all, loss_opt * ones(length(delta_all),1), 'ro--','LineWidth',3,'MarkerSize',3); hold on
% loglog(delta_all, abs(mean(loss_opt_fm_dp)), 'b*--','LineWidth',3,'MarkerSize',3)
% loglog(delta_all, abs(mean(loss_opt_fm_dp_imp)), 'ksq--','LineWidth',3,'MarkerSize',3)
% set(gca,'FontSize',FS,'FontWeight','bold')
% xlabel('Privacy parameter (\epsilon)','FontSize',FS,'FontWeight','bold');
% ylabel('Empirical loss','FontSize',FS,'FontWeight','bold');
% legend('Non-priv', 'Func. mech.', 'Improved Func. mech.', 'Location','best')
% 
