% Specifications
cutoff_frequency = 2e6;    % Desired cutoff frequency in Hz (-3 dB point)
sampling_frequency = 10e6; % Sampling frequency in Hz
orders = [2, 3, 4, 5];     % Filter orders to analyze

% Pre-allocate cell arrays to store filter coefficients and responses
b = cell(length(orders), 1);
a = cell(length(orders), 1);
H = cell(length(orders), 1);

% Frequency vector for analysis
[~, f] = freqz(1, 1, 1024, sampling_frequency); % Generate frequency points

% Design filters and scale their cutoff frequency
for i = 1:length(orders)
    % Design Butterworth filter with normalized cutoff of 1 rad/s
    [b_temp, a_temp] = butter(orders(i), 1, 'low', 's');
    
    % Scale filter to the desired cutoff frequency (2 MHz)
    [b{i}, a{i}] = lp2lp(b_temp, a_temp, 2 * pi * cutoff_frequency);
    
    % Discretize the scaled filter for the given sampling frequency
    [b{i}, a{i}] = bilinear(b{i}, a{i}, sampling_frequency);
    
    % Frequency response
    [H{i}, ~] = freqz(b{i}, a{i}, 1024, sampling_frequency);
end

% Plotting
figure;

% Magnitude response
hold on;
colors = ['b', 'r', 'g', 'm']; % Colors for different orders
for i = 1:length(orders)
    semilogx(f, 20*log10(abs(H{i})), colors(i), 'LineWidth', 1.5);
end
hold off;
title('Butterworth Filter (Scaled to 2 MHz Cutoff): Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Order 2', 'Order 3', 'Order 4', 'Order 5');
grid on;
axis([1e5, sampling_frequency/2, -80, 5]);
