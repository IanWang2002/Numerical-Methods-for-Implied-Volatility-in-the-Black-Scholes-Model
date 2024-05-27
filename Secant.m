function p = Secant(p0, p1, call_price, S, K, T, r, tol, Nmax)
    n = 0;
    p = [p0, p1];

    while n < Nmax
        p(end + 1) = p(end) - ((black_scholes_call(S, K, T, r, p(end)) - call_price) * (p(end) - p(end - 1))) / ...
            ((black_scholes_call(S, K, T, r, p(end)) - call_price) - (black_scholes_call(S, K, T, r, p(end - 1)) - call_price));
        
        if abs(p(end) - p(end - 1)) < tol
            return;
        end

        n = n + 1;
    end

    error('Function does not converge within the maximum iteration limit.');
end
