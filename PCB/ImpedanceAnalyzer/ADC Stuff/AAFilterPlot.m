% Define the constants
num1 = 1.579136706E14;  % Numerator for both stages
den1 = [1, 9.617883684E6, 1.579136706E14];  % Denominator of the first stage
den2 = [1, 2.321962522E7, 1.579136706E14];  % Denominator of the second stage

% Create transfer functions for the individual stages
H1 = tf(num1, den1);  % First stage
H2 = tf(num1, den2);  % Second stage

% Overall transfer function
H = H1 * H2;

% Define frequency range (logarithmic scale for better visibility)
f = logspace(4, 8, 1000);  % Frequencies from 10^4 to 10^8 Hz
omega = 2 * pi * f;  % Convert frequencies to angular frequencies

% Compute the frequency response
[mag, ~] = bode(H, omega);  % Magnitude response; phase (~) is ignored

% Convert magnitude to a linear array (squeeze removes singleton dimensions)
mag = squeeze(mag);

% Plot the magnitude response
figure;
semilogx(f, 20*log10(mag));  % Plot magnitude in dB vs frequency (Hz)
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Response of the Transfer Function');

% Hold the current plot to add additional lines and annotations
hold on;

% Mark the -3 dB point (find the closest value to -3 dB)
dB_minus3 = -3; 
[~, idx_minus3] = min(abs(20*log10(mag) - dB_minus3));  % Find index closest to -3 dB
f_minus3 = f(idx_minus3);  % Corresponding frequency

% Mark 2 MHz point (2 * 10^6 Hz)
f_2MHz = 2e6;
[~, idx_2MHz] = min(abs(f - f_2MHz));  % Find index closest to 2 MHz

% Add a vertical line at the -3 dB point
plot([f_minus3 f_minus3], ylim, 'r--', 'LineWidth', 2);  % Red dashed line at -3 dB point

% Add a vertical line at 2 MHz
plot([f_2MHz f_2MHz], ylim, 'g--', 'LineWidth', 2);  % Green dashed line at 2 MHz point

% Adjust the y-coordinate for the -3 dB annotation to move it down
offset = 4;  % Change this value to adjust the vertical offset

% Annotate the -3 dB point with font size 24
text(f_minus3, dB_minus3 - offset, sprintf('  -3 dB (%.2f Hz)', f_minus3), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 24);

% Annotate the 2 MHz point with font size 24
text(f_2MHz, 20*log10(mag(idx_2MHz)) - offset, sprintf('  2 MHz (%.2f dB)', 20*log10(mag(idx_2MHz))), 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 24);

% Release the hold on the plot
hold off;
