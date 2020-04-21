function eff_delta_all = calculateDelta(epsilon, delta_all, S, N)
    eff_delta_all = zeros(length(delta_all), 1);
    for d_id = 1:length(delta_all)
        delta = delta_all(d_id);
        eff_delta_all(d_id) = capeDelta(epsilon, delta, S, N);
    end
return