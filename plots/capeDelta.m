function eff_delta = capeDelta(epsilon, delta, S, N)
    Sc = ceil(S/3) - 1;
    Sh = S - Sc;
    Ns = N / S;
    tau = (1 / (Ns * epsilon)) * sqrt(2 * log(1.25/delta));
    
    Sigma_a = (1 + 1/S) * tau^2 * eye(Sh) - ones(Sh, Sh) * (tau^2 / S);
    Sigma_ae = ones(Sh, 1) * (1-Sh/S) * tau^2;
    Sigma_e = Sh * tau^2;
    Sigma = [Sigma_a, Sigma_ae; Sigma_ae', Sigma_e];
    v = [1/Ns; zeros(Sh, 1)];

    mu_z = 0.5 * v' * pinv(Sigma) * v;
    sigma_sq_z = v' * pinv(Sigma) * v;

    tmp = (epsilon - mu_z) / sqrt(sigma_sq_z);
    eff_delta = 2 * qfunc(tmp);
return
