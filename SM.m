% Set MATLAB display precision
format long;

% Given parameters
call_option_price = 8.0;
current_stock_price = 100.0;
strike_price = 95.0;
time_to_maturity = 0.5;
risk_free_interest_rate = 0.02;

% Find the root using the secant method
p_values = Secant(0.0001, 0.5, call_option_price, current_stock_price, strike_price, time_to_maturity, risk_free_interest_rate, 0.000001, 1000);

% Calculate fcn values
fcn_values = arrayfun(@(sigma) black_scholes_call(current_stock_price, strike_price, time_to_maturity, risk_free_interest_rate, sigma), p_values);

% Calculate differences
diff_values = [p_values(1), diff(p_values)];

% Create a table
secant_table = table((0:numel(p_values)-1)', p_values', fcn_values', diff_values', 'VariableNames', {'iteration', 'p_values', 'fcn_values', 'diff_values'});

% Display the table
disp(secant_table);
