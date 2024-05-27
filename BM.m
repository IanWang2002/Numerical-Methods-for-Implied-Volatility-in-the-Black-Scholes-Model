% Set MATLAB display precision
format long;

% Main script
% Given parameters
call_option_price = 8.0;
current_stock_price = 100.0;
strike_price = 95.0;
time_to_maturity = 0.5;
risk_free_interest_rate = 0.02;

% Find implied volatility
final_implied_volatility = implied_volatility_bisection_call(call_option_price, current_stock_price, strike_price, time_to_maturity, risk_free_interest_rate, 0.01, 2.0, 1e-6, 100);

% Display the final implied volatility
fprintf('Final Calculated Implied Volatility: %.9f\n', final_implied_volatility);
