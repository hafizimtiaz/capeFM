clear; clc; close all

% load data
filepath = '../Datasets/';
N_all = [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800]';
D = 101;
mu = 0.0; % regularizer
numItr = 10;
epsilon = 0.2;
delta = 0.001;
S = 5; % number of sites

loss_opt_np = zeros(numItr, length(N_all));
loss_opt_cape = zeros(numItr, length(N_all));
loss_opt_conv = zeros(numItr, length(N_all));
loss_opt_local = zeros(numItr, length(N_all));
loss_opt_exst = zeros(numItr, length(N_all));


for itr = 1:numItr
    for n_id = 1:length(N_all)
        N = N_all(n_id);
        filename = ['crime_D_',num2str(D),'_N_',num2str(N),'.mat'];
        load([filepath, filename]);
        
        [w_opt_np, loss_opt_np(itr, n_id), w_opt_cape, loss_opt_cape(itr, n_id), ...
            w_opt_conv, loss_opt_conv(itr, n_id), w_opt_local, loss_opt_local(itr, n_id),...
            w_opt_exst, loss_opt_exst(itr, n_id)] = myLinReg(X, y, mu, S, epsilon, delta);
        
    end
end
save(['results_vs_samples_crime_D_',num2str(D),'_eps_0_2'],...
        'loss_opt_np', 'loss_opt_cape', 'loss_opt_conv', 'loss_opt_local', ...
        'loss_opt_exst', 'N_all', 'delta', 'S', 'mu', 'epsilon')

