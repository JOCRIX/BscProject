% Specifications
n = 3;                 % Filter order
Rs = 60;               % Stopband attenuation (dB)
Wp = 1;                % Normalized passband edge (rad/s)

% Design the filter
[b, a] = cheby2(n, Rs, Wp, 'low', 's');   % Design the filter coefficients

% High-resolution frequency response
Fs = 1000;             % High sampling rate for better resolution
freqRange = linspace(0, 3, Fs); % Frequency range from 0 to 5 rad/s

% Frequency response
[H, w] = freqs(b, a, freqRange);

% Group delay
[gd, w_gd] = grpdelay(b, a, freqRange, 'whole');

% Plotting
figure;

% Magnitude Response
subplot(3, 1, 1);
plot(w, 20*log10(abs(H)), 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Magnitude Response');
ylim([-120 5]);

% Phase Response
subplot(3, 1, 2);
plot(w, angle(H), 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (radians)');
title('Phase Response');

% Group Delay
subplot(3, 1, 3);
plot(w_gd, gd, 'LineWidth', 1.5);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Group Delay (seconds)');
title('Group Delay');

% Display filter coefficients
disp('Numerator Coefficients (b):');
disp(b);
disp('Denominator Coefficients (a):');
disp(a);
