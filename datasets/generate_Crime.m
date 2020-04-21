clear; clc; close all

load('/Users/hafizimtiaz/Desktop/crime_data.mat')
% data = table2array(Twitter);
XT = data(:, 1:127);
yT = data(:, end);
[NT,D] = size(XT);
XT_clean = [];
for d = 1:D
    ids = ismissing(XT(:,d));
    if sum(ids) == 0
        XT_clean = [XT_clean XT(:,d)];
    end
end
XT_clean(:,2) = [];
XT_clean = double(XT_clean);
[~, D] = size(XT_clean);
for d = 1:D
    XT_clean(:,d) = XT_clean(:,d) / max(abs(XT_clean(:,d)));
end
yT = double(yT) / max(abs(double(yT)));



N_all = [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800]';
for n_id = 1:length(N_all)
    N = N_all(n_id);
    % randomly sample N 
    ids = randsample(NT, N);
    X = XT_clean(ids, :);
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

    save(['crime_D_',num2str(D),'_N_',num2str(N)], 'X', 'y', 'D', 'N')
end
