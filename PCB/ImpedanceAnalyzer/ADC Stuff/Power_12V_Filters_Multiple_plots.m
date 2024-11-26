% Specifications
Fs = 1000; % Sampling frequency (chosen to be sufficiently high)
Fdip = 50; % Frequency where the first dip (zero) should occur
Rp = 3;    % Stopband ripple in dB
Rs = 60;   % Stopband attenuation in dB

% Normalize the dip frequency (where the first singularity occurs)
Ws = 2 * Fdip / Fs;  % Normalized stopband edge frequency

% Orders to analyze
filter_orders = [3, 4, 5, 6, 7, 8];

% Colors for different filter orders
colors = lines(length(filter_orders));

% Frequency vector for responses
N_points = 1024000; % Increased resolution (1000x higher than original 1024)
f = linspace(0, Fs/2, N_points);

% Initialize figure for combined plots
figure;

% Loop over each filter order
for i = 1:length(filter_orders)
    n = filter_orders(i); % Current filter order
    
    % Design the Inverse Chebyshev lowpass filter
    [b, a] = cheby2(n, Rs, Ws, 'low');
    
    % Frequency response
    [H, ~] = freqz(b, a, N_points, Fs);
    
    % Group delay
    [gd, f_gd] = grpdelay(b, a, N_points, Fs);
    
    % Plot Magnitude Response
    subplot(3, 1, 1);
    hold on;
    plot(f, 20*log10(abs(H)), 'LineWidth', 1.5, 'Color', colors(i, :));
    title('Magnitude Response');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    xlim([0 500]);
    ylim([-120 10]);
    grid on;
    
    % Plot Phase Response
    subplot(3, 1, 2);
    hold on;
    plot(f, angle(H), 'LineWidth', 1.5, 'Color', colors(i, :));
    title('Phase Response');
    xlabel('Frequency (Hz)');
    ylabel('Phase (radians)');
    xlim([0 500]);
    grid on;
    
    % Plot Group Delay
    subplot(3, 1, 3);
    hold on;
    plot(f_gd, gd, 'LineWidth', 1.5, 'Color', colors(i, :));
    title('Group Delay');
    xlabel('Frequency (Hz)');
    ylabel('Group Delay (samples)');
    xlim([0 500]);
    grid on;
end

% Add legends
subplot(3, 1, 1);
legend(arrayfun(@(n) ['Order = ' num2str(n)], filter_orders, 'UniformOutput', false), 'Location', 'Best');

subplot(3, 1, 2);
legend(arrayfun(@(n) ['Order = ' num2str(n)], filter_orders, 'UniformOutput', false), 'Location', 'Best');

subplot(3, 1, 3);
legend(arrayfun(@(n) ['Order = ' num2str(n)], filter_orders, 'UniformOutput', false), 'Location', 'Best');

sgtitle('High-Resolution Magnitude, Phase, and Group Delay Responses for Different Filter Orders');
