function final_implied_volatility = implied_volatility_bisection_call(call_price, S, K, T, r, a, b, tol, max_iter)
    fprintf('Iteration\tan\t\tbn\t\tcn\t\tabs(fcn)\n');
    
    fa = call_price - black_scholes_call(S, K, T, r, a);
    fb = call_price - black_scholes_call(S, K, T, r, b);

    if sign(fa) == sign(fb)
        error('Initial bounds [a, b] must enclose the root.');
    end

    for n = 1:max_iter
        c = (a + b) / 2;
        fc = call_price - black_scholes_call(S, K, T, r, c);

        fprintf('%d\t\t%.9f\t%.9f\t%.9f\t%.9f\n', n, a, b, c, abs(fc));

        if abs(fc) < tol
            final_implied_volatility = c;
            return;
        end

        if sign(fc) == sign(fa)
            a = c;
            fa = fc;
        else
            b = c;
            fb = fc;
        end
    end

    error('The bisection method did not converge.');
end
