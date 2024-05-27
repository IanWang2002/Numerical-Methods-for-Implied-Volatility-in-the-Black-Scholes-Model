function v = NM_call2(S, K, T, r, sigma)
    d1 = (log(S / K) + (r + sigma^2 / 2) * T) / (sigma * sqrt(T));
    v = S * normpdf(d1) * sqrt(T);
end
