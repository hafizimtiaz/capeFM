function [w_opt_np, loss_opt_np, w_opt_cape, loss_opt_cape, ...
            w_opt_conv, loss_opt_conv, w_opt_local, loss_opt_local,...
            w_opt_exst, loss_opt_exst] = myLinReg(X, y, mu, S, epsilon, delta)
        
    % code for computing linear regression with DP
    % ---------------------------------------------------------------------
    % X = N-by-D sample matrix, each row is a D-dimensional sample
    % y = N-by-1 response vector
    % mu = regularizer for the loss function
    % S = number of sites
    % epsilon, delta = privacy parameters
    % w_opt, loss_opt = optimal w and loss at optimal w for various algorithms
    % ---------------------------------------------------------------------
    
    [N, D] = size(X);
    variance = @(delf, eps, del) (delf / eps) * sqrt(2 * log (1.25 / del));
    lb = - 1 * ones(D,1);
    ub = 1 * ones(D,1);
    A = []; b = []; Aeq = []; beq = [];
    w_init = ones(D,1); w_init = w_init / norm(w_init);
    opts = optimoptions(@fmincon,'Display','off', 'Algorithm', 'interior-point');
    
    % non-private pooled scenario =========================================
    lambda_1 = (1/N) * norm(y)^2;
    lambda_w = (-2/N) * sum(diag(y) * X); lambda_w = lambda_w';
    lambda_ww = (1/N) * (X' * X);
    
    loss_np = @(w) lambda_1 + w' * lambda_w + trace((w * w') * lambda_ww) + mu * norm(w)^2;
    [w_opt_np, loss_opt_np] = fmincon(loss_np, w_init, A, b, Aeq, beq, lb, ub, [], opts);
    
    % capeFM ==============================================================
    Delf_1 = 1/N;
    Delf_w = 4/N;
    Delf_ww = sqrt(2)/N;
    sigma_1 = variance(Delf_1, epsilon, delta);
    sigma_w = variance(Delf_w, epsilon, delta);
    sigma_ww = variance(Delf_ww, epsilon, delta);
    noise_1 = sigma_1 * randn(1);
    noise_w = sigma_w * randn(D, 1);
    noise_ww = sigma_ww * randn(D, D);
    lambda_1_hat = lambda_1 + noise_1;
    lambda_w_hat = lambda_w + noise_w;
    lambda_ww_hat = lambda_ww + noise_ww;
    loss_cape = @(w) lambda_1_hat + w' * lambda_w_hat + trace((w * w') * lambda_ww_hat) + mu * norm(w)^2;
    [w_opt_cape, loss_opt_cape] = fmincon(loss_cape, w_init, A, b, Aeq, beq, lb, ub, [], opts);
    
    % existing pooled FM ==================================================
    Delf = (2/N) * (D+1)^2;
    sigma = variance(Delf, epsilon, delta);
    noise_1 = sigma * randn(1);
    noise_w = sigma * randn(D, 1);
    noise_ww = sigma * randn(D, D);
    
    lambda_1_hat = lambda_1 + noise_1;
    lambda_w_hat = lambda_w + noise_w;
    lambda_ww_hat = lambda_ww + noise_ww;
    loss_exst = @(w) lambda_1_hat + w' * lambda_w_hat + trace((w * w') * lambda_ww_hat) + mu * norm(w)^2;
    [w_opt_exst, loss_opt_exst] = fmincon(loss_exst, w_init, A, b, Aeq, beq, lb, ub, [], opts);
    
    % conventional dist FM ================================================
    Ns = round(N / S);
    
    Delf_1 = 1/Ns;
    Delf_w = 4/Ns;
    Delf_ww = sqrt(2) / Ns;
    sigma_1 = variance(Delf_1, epsilon, delta);
    sigma_w = variance(Delf_w, epsilon, delta);
    sigma_ww = variance(Delf_ww, epsilon, delta);
    
    lambda_1_hat = 0;
    lambda_w_hat = 0;
    lambda_ww_hat = 0;
    st_id = 1;
    en_id = Ns;
    for s = 1:S
        tmpX = X(st_id:en_id, :);
        tmpy = y(st_id:en_id);
        st_id = st_id + Ns;
        en_id = en_id + Ns;
        
        noise_1 = sigma_1 * randn(1);
        noise_w = sigma_w * randn(D, 1);
        noise_ww = sigma_ww * randn(D, D);
        
        lambda_1 = (1/Ns) * norm(tmpy)^2;
        lambda_w = (-2/Ns) * sum(diag(tmpy) * tmpX); lambda_w = lambda_w';
        lambda_ww = (1/Ns) * (tmpX' * tmpX);
        
        lambda_1_hat = lambda_1_hat + lambda_1 + noise_1;
        lambda_w_hat = lambda_w_hat + lambda_w + noise_w;
        lambda_ww_hat = lambda_ww_hat + lambda_ww + noise_ww;
    end
    lambda_1_hat = (1/S) * lambda_1_hat;
    lambda_w_hat = (1/S) * lambda_w_hat;
    lambda_ww_hat = (1/S) * lambda_ww_hat;
    loss_conv = @(w) lambda_1_hat + w' * lambda_w_hat + trace((w * w') * lambda_ww_hat) + mu * norm(w)^2;
    [w_opt_conv, loss_opt_conv] = fmincon(loss_conv, w_init, A, b, Aeq, beq, lb, ub, [], opts);
    
    % local FM (for s = S) ================================================
    lambda_1_hat = lambda_1 + noise_1;
    lambda_w_hat = lambda_w + noise_w;
    lambda_ww_hat = lambda_ww + noise_ww;
    loss_local = @(w) lambda_1_hat + w' * lambda_w_hat + trace((w * w') * lambda_ww_hat) + mu * norm(w)^2;
    [w_opt_local, loss_opt_local] = fmincon(loss_local, w_init, A, b, Aeq, beq, lb, ub, [], opts);
return;