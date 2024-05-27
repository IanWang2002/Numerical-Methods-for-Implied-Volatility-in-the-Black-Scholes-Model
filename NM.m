% Example values (adjust these with real market data)
C = 8;  % Call option price
S = 100;  % Current stock price
K = 95;  % Strike price of the option
T = 0.5;    % Time to maturity in years
r = 0.02;  % Risk-free interest rate

% Find the implied volatility
[vol, data] = newton_volatility(C, S, K, T, r);

% Display the results
disp('Volatility: ');
disp(vol);
disp('Iteration Data: ');
disp(data);
