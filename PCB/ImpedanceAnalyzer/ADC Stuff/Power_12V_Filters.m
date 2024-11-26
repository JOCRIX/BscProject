% Specifications
Fs = 1000; % Sampling frequency (chosen to be sufficiently high)
Fdip = 50; % Frequency where the first dip (zero) should occur
Rp = 3;    % Stopband ripple in dB
Rs = 60;   % Stopband attenuation in dB

% Normalize the dip frequency (where the first singularity occurs)
Ws = 2 * Fdip / Fs;  % Normalized stopband edge frequency

% Design the Inverse Chebyshev lowpass filter
% Adjust Rs to ensure the first dip aligns at Ws
[n, Wn] = cheb2ord(Ws + 0.01, Ws, Rp, Rs); % Slightly adjust transition region
[b, a] = cheby2(n, Rs, Wn, 'low');         % Design the filter

% Frequency response
[H, f] = freqz(b, a, 1024, Fs);

% Magnitude plot
figure;
subplot(3, 1, 1);
plot(f, 20*log10(abs(H)), 'LineWidth', 1.5);
grid on;
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0 500]);
ylim([-120 10]);

% Phase plot
subplot(3, 1, 2);
plot(f, angle(H), 'LineWidth', 1.5);
grid on;
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
xlim([0 500]);

% Group delay
[gd, f_gd] = grpdelay(b, a, 1024, Fs);
subplot(3, 1, 3);
plot(f_gd, gd, 'LineWidth', 1.5);
grid on;
title('Group Delay');
xlabel('Frequency (Hz)');
ylabel('Group Delay (samples)');
xlim([0 500]);
