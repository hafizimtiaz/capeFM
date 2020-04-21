clear; clc; close all

% load data
filepath = '../Datasets/';
N_all = [500, 1000, 2000, 5000, 10000, 20000, 30000]';
D = 50;
numItr = 10;
epsilon = 0.5;
delta = 1e-5;
S = 5; % number of sites
mu = 0.0; % regularizer
lb = - 1 * ones(D,1);
ub = 1 * ones(D,1);
A = []; b = []; Aeq = []; beq = [];
w_init = ones(D,1); w_init = w_init / norm(w_init);
opts = optimoptions(@fmincon,'Display','off', 'Algorithm', 'interior-point');

loss_opt_op = zeros(numItr, length(N_all));
errW_op = zeros(numItr, length(N_all));

for itr = 1:numItr
    for n_id = 1:length(N_all)
        N = N_all(n_id);
        filename = ['synth_D_',num2str(D),'_N_',num2str(N),'.mat'];
        load([filepath, filename]);
        
        % non-private
        loss = @(w) (1/N) * norm(y - X * w)^2 + mu * norm(w)^2;
        [w_opt, loss_opt] = fmincon(loss, w_init, A, b, Aeq, beq, lb, ub, [], opts);
        
        % add noise for objective perturbation
        beta_p = epsilon / 2;
        noise = myVectorNoise( beta_p , D );
        w_opt_op = w_opt + noise;
        
        loss_opt_op(itr, n_id) = loss(w_opt_op);
        
        errW_op(itr, n_id) = (1/D) * norm(beta - w_opt_op);
    end
end
save(['OP_results_vs_samples_synth_D_',num2str(D),'_eps_0_5'],...
        'loss_opt_op', 'errW_op', 'N_all', 'delta', 'S', 'mu', 'epsilon')

