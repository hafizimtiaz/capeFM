clear; clc; close all

load('/Users/hafizimtiaz/Desktop/regression/Twitter/Twitter.data')
% data = table2array(Twitter);
XT = Twitter(:, 1:77);
yT = Twitter(:, end);
[NT,D] = size(XT);
for d = 1:D
    XT(:,d) = XT(:,d) / max(abs(XT(:,d)));
end
yT = yT/max(abs(yT));



N_all = [500, 1000, 2000, 5000, 10000, 20000, 30000]';
for n_id = 1:length(N_all)
    N = N_all(n_id);
    % randomly sample N 
    ids = randsample(NT, N);
    X = XT(ids, :);
    y = yT(ids);
    
    nrms = zeros(N,1);
    for n = 1:N
        nrms(n) = norm(X(n,:));
    end
    
    max_nrm = max(nrms);
    for n = 1:N
        X(n,:) = X(n,:) / max_nrm;
    end
    y = y / max(abs(y));

    save(['twitter_D_',num2str(D),'_N_',num2str(N)], 'X', 'y', 'D', 'N')
end
