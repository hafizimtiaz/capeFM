clear; clc; close all
% code for computing the objective perturbation performance
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
[w_opt, loss_opt] = fmincon(loss, w_init, A, b, Aeq, beq, lb, ub, [], opts);


% test the dp-functional approach with the improved one
numItr = 10; FS = 24;
epsilon_all = [1e-3, 5e-3, 1e-2, 5e-2, 1e-1, 5e-1, 1, 5, 10]';
delta = 0.01;
S = 5; % number of sites

loss_opt_op = zeros(numItr, length(epsilon_all));

errW_op = zeros(numItr, length(epsilon_all));

for itr = 1:numItr
    for eps_id = 1:length(epsilon_all)
        epsilon = epsilon_all(eps_id);

        % add noise for objective perturbation
        beta_p = epsilon / 2;
        noise = myVectorNoise( beta_p , D );
        w_opt_op = w_opt + noise;
        
        loss_opt_op(itr, eps_id) = loss(w_opt_op);
        
        errW_op(itr, eps_id) = (1/D) * norm(beta - w_opt_op);
    end
end
save(['OP_results_vs_epsilon_synth_D_',num2str(D),'_N_',num2str(N)],...
        'loss_opt_op', 'errW_op', 'epsilon_all', 'delta', 'S', 'mu')
