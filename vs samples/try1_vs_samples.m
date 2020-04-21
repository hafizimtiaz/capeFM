clear; clc; close all

% load data
filepath = '../Datasets/';
N_all = [500, 1000, 2000, 5000, 10000, 20000, 30000]';
D = 50;
mu = 0.0; % regularizer
numItr = 10;
epsilon = 0.5;
delta = 1e-5;
S = 5; % number of sites

loss_opt_np = zeros(numItr, length(N_all));
loss_opt_cape = zeros(numItr, length(N_all));
loss_opt_conv = zeros(numItr, length(N_all));
loss_opt_local = zeros(numItr, length(N_all));
loss_opt_exst = zeros(numItr, length(N_all));

errW_np = zeros(numItr, length(N_all));
errW_cape = zeros(numItr, length(N_all));
errW_conv = zeros(numItr, length(N_all));
errW_local = zeros(numItr, length(N_all));
errW_exst = zeros(numItr, length(N_all));


for itr = 1:numItr
    for n_id = 1:length(N_all)
        N = N_all(n_id);
        filename = ['synth_D_',num2str(D),'_N_',num2str(N),'.mat'];
        load([filepath, filename]);
        
        [w_opt_np, loss_opt_np(itr, n_id), w_opt_cape, loss_opt_cape(itr, n_id), ...
            w_opt_conv, loss_opt_conv(itr, n_id), w_opt_local, loss_opt_local(itr, n_id),...
            w_opt_exst, loss_opt_exst(itr, n_id)] = myLinReg(X, y, mu, S, epsilon, delta);
        
        errW_np(itr, n_id) = (1/D) * norm(beta - w_opt_np);
        errW_cape(itr, n_id) = (1/D) * norm(beta - w_opt_cape);
        errW_conv(itr, n_id) = (1/D) * norm(beta - w_opt_conv);
        errW_local(itr, n_id) = (1/D) * norm(beta - w_opt_local);
        errW_exst(itr, n_id) = (1/D) * norm(beta - w_opt_exst);
    end
end
save(['results_vs_samples_synth_D_',num2str(D),'_eps_0_5'],...
        'loss_opt_np', 'loss_opt_cape', 'loss_opt_conv', 'loss_opt_local', ...
        'loss_opt_exst', 'errW_np', 'errW_cape', 'errW_conv', 'errW_local', ...
        'errW_exst', 'N_all', 'delta', 'S', 'mu', 'epsilon')

