function [vol, data] = newton_volatility(C, S, K, T, r)
    guess = 1;  % Initial guess for volatility
    tolerance = 1e-6;  % Tolerance for stopping the search
    i = 0;
    data = [];

    while true
        i = i + 1;
        price = NM_call1(S, K, T, r, guess);
        v = NM_call2(S, K, T, r, guess);

        % Avoid division by zero
        if v == 0
            break;
        end

        error = (price - C) / v;

        % Log iteration details
        data(i,:) = [guess, price, error];

        % Check for convergence
        if abs(error) < tolerance
            break;
        end

        guess = guess - error;  % Update guess
    end

    vol = guess;
end
