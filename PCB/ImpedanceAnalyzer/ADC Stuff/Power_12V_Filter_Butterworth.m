% MATLAB Code: Butterworth Lowpass Filter Analysis (Normalized to 1 rad/s)
clc;
clear;
close all;

% Parameters
Fs = 1000;            % Sampling frequency (Hz)
Fc = 100;             % Cutoff frequency (Hz)
filter_orders = [2, 3, 4, 5]; % Filter orders to analyze
colors = ['r', 'g', 'b', 'k']; % Colors for different filter orders

% Convert cutoff frequency from Hz to rad/s
Fc_rad = 2 * pi * Fc;  % Cutoff frequency in radians per second

% Initialize the figure
figure('Name', 'Butterworth Lowpass Filter Analysis (Normalized to 1 rad/s)', 'NumberTitle', 'off');

% Loop through different filter orders
for idx = 1:length(filter_orders)
    n = filter_orders(idx);
    % Normalize the cutoff frequency to 1 rad/s
    Wn = 1; % Normalized cutoff to 1 rad/s
    
    % Design the Butterworth lowpass filter
    [b, a] = butter(n, Wn, 'low', 's'); % 's' option for analog filter
    
    % Frequency response (digital frequency response using bilinear transform)
    [H, f] = freqz(b, a, 1024, Fs); % Frequency response
    magnitude = abs(H);             % Magnitude response
    phase = angle(H);               % Phase response
    [gd, w] = grpdelay(b, a, 1024, Fs); % Group delay
    
    % Plot magnitude response
    subplot(3, 1, 1);
    plot(f, 20 * log10(magnitude), 'DisplayName', ['Order n = ', num2str(n)], ...
        'Color', colors(idx), 'LineWidth', 1.5);
    hold on;
    grid on;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title('Magnitude Response');
    legend('show');
    
    % Plot phase response
    subplot(3, 1, 2);
    plot(f, unwrap(phase) * 180 / pi, 'DisplayName', ['Order n = ', num2str(n)], ...
        'Color', colors(idx), 'LineWidth', 1.5);
    hold on;
    grid on;
    xlabel('Frequency (Hz)');
    ylabel('Phase (degrees)');
    title('Phase Response');
    legend('show');
    
    % Plot group delay
    subplot(3, 1, 3);
    plot(w, gd, 'DisplayName', ['Order n = ', num2str(n)], ...
        'Color', colors(idx), 'LineWidth', 1.5);
    hold on;
    grid on;
    xlabel('Frequency (Hz)');
    ylabel('Group Delay (samples)');
    title('Group Delay');
    legend('show');
end
