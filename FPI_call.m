%normcdf function Required to download the Statistics and Machine Learning Toolbox.
function price = FPI_call(S, K, T, r, sigma)
    d1 = (log(S / K) + (r + 0.5 * sigma^2) * T) / (sigma * sqrt(T));
    d2 = d1 - sigma * sqrt(T);
    price = S * normcdf(d1) - K * exp(-r * T) * normcdf(d2);
end

