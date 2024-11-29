% Specifications
cutoff_frequency = 2e6;    % Desired cutoff frequency in Hz (-3 dB point)
sampling_frequency = 10e6; % Sampling frequency in Hz
orders = [2, 3, 4, 5];     % Filter orders to analyze
test_frequency = 1e6;      % Frequency at which to measure gain (1 MHz)

% Pre-allocate cell arrays to store filter coefficients and responses
b = cell(length(orders), 1);
a = cell(length(orders), 1);
gains_at_1MHz = zeros(length(orders), 1); % Store gains at 1 MHz

% Scale filters and compute gain at 1 MHz
for i = 1:length(orders)
    % Design Butterworth filter with normalized cutoff of 1 rad/s
    [b_temp, a_temp] = butter(orders(i), 1, 'low', 's');
    
    % Scale filter to the desired cutoff frequency (2 MHz)
    [b{i}, a{i}] = lp2lp(b_temp, a_temp, 2 * pi * cutoff_frequency);
    
    % Discretize the scaled filter for the given sampling frequency
    [b{i}, a{i}] = bilinear(b{i}, a{i}, sampling_frequency);
    
    % Frequency response
    [H, f] = freqz(b{i}, a{i}, 1024, sampling_frequency);
    
    % Find gain at 1 MHz
    [~, idx] = min(abs(f - test_frequency)); % Find closest frequency index
    gains_at_1MHz(i) = abs(H(idx));         % Magnitude response at 1 MHz
end

% Display results
disp('Gain at 1 MHz for Butterworth filters:');
for i = 1:length(orders)
    fprintf('Order %d: %.4f (linear) or %.2f dB\n', ...
        orders(i), gains_at_1MHz(i), 20*log10(gains_at_1MHz(i)));
end

% Plot gain differences
figure;
plot(orders, 20*log10(gains_at_1MHz), '-o', 'LineWidth', 1.5);
title('Gain at 1 MHz for Butterworth Filters');
xlabel('Filter Order');
ylabel('Gain at 1 MHz (dB)');
grid on;
