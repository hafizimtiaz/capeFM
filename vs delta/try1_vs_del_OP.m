clear; clc; close all

% load data
filepath = '../Datasets/';
filename = 'synth_D_50_N_5000.mat';
load([filepath, filename]);

% solve using regular optimization
mu = 0.0; % regularizer
loss = @(w) (1/N) * norm(y - X * w)^2 + mu * norm(w)^2;
lb = - 1 * ones(D,1);
ub = 1 * ones(D,1);
A = []; b = []; Aeq = []; beq = [];
w_init = ones(D,1); w_init = w_init / norm(w_init);
opts = optimoptions(@fmincon,'Display','off', 'Algorithm', 'interior-point');
[w_opt, loss_opt] = fmincon(loss, w_init, A, b, Aeq, beq, lb, ub, [], opts);

% test the dp-functional approach with the improved one
numItr = 10; FS = 24;
epsilon = 0.5;
delta_all = [1e-6, 5e-6, 1e-5, 5e-5, 1e-4, 5e-4, 1e-3, 5e-3, 1e-2, 5e-2]';
S = 5; % number of sites

loss_opt_op = zeros(numItr, length(delta_all));
errW_op = zeros(numItr, length(delta_all));

for itr = 1:numItr
    for del_id = 1:length(delta_all)
        delta = delta_all(del_id);

        % add noise for objective perturbation
        beta_p = epsilon / 2;
        noise = myVectorNoise( beta_p , D );
        w_opt_op = w_opt + noise;
        
        loss_opt_op(itr, del_id) = loss(w_opt_op);
        errW_op(itr, del_id) = (1/D) * norm(beta - w_opt_op);
        
    end
end
save(['OP_results_vs_delta_synth_D_',num2str(D),'_N_',num2str(N),'_eps_0_5'],...
        'loss_opt_op', 'errW_op', 'delta_all', 'epsilon', 'S', 'mu')
