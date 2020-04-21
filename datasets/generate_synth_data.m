clear; clc; close all
% model params
D = 50;
N_all = [500, 1000, 2000, 5000, 10000, 20000, 30000]';

for n_id = 1:length(N_all)
    N = N_all(n_id);
    % data generation
    X = rand(D, N); X = normc(X);
    X = X';

    beta = 2 * rand(D,1) - 1; % entries are uniform in [-1, 1]
    beta = beta/norm(beta);
    y = X * beta;

    save(['synth_D_',num2str(D),'_N_',num2str(N)], 'X', 'beta', 'y', 'D', 'N')
end