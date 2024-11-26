% MATLAB Code for Inverse Chebyshev Lowpass Filter with n = 3

% Sampling frequency (arbitrary, since we use normalized frequencies)
Fs = 10; % Sampling frequency in Hz (for normalization)

% Specifications
Ap = 10; % Passband attenuation in dB
As = 40; % Stopband attenuation in dB
Fp = 1;  % Passband edge frequency in Hz
Fs_edge = 2; % Stopband edge frequency in Hz
n = 3;   % Filter order

% Normalize frequencies
Wp = Fp / (Fs / 2);      % Normalize passband edge frequency
Ws = Fs_edge / (Fs / 2); % Normalize stopband edge frequency

% Design the filter
[b, a] = cheby2(n, As, Wp, 'low');  % Design the Inverse Chebyshev filter

% Frequency response
omega = linspace(0, 3, 1000); % Define the frequency range (normalized)
[H, w] = freqz(b, a, 1000, Fs); % Compute frequency response with normalized frequencies

% Magnitude plot
figure;
plot(w, 20*log10(abs(H)), 'LineWidth', 1.5); % w / 1.1547 for at flytte singulariteten til 1 rad/s.
grid on;
xlabel('\omega (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Response of Inverse Chebyshev Lowpass Filter (n = 3)');
axis([0 3 -80 5]); % Adjust y-axis for better visualization
