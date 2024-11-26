% Parameters
n = 3;                 % Filter order
rp = 1;                % Passband ripple (in dB)
wc = 0.5;              % Normalized cutoff frequency (0.5 corresponds to Nyquist frequency)

% Design the Chebyshev Type I lowpass filter
% Use cheby1 to create a lowpass filter prototype (normalized)
[b, a] = cheby1(n, rp, wc);

% Frequency response of the inverse filter
% To get the inverse of the lowpass filter, we take the reciprocal of the frequency response

% Frequency vector for plotting
f = logspace(-1, 1, 1000);   % Logarithmic frequency scale for better resolution
[H, w] = freqz(b, a, f, 'whole');   % Get frequency response

% Plot magnitude response
figure;
subplot(3,1,1);
semilogx(f, 20*log10(abs(H)));
title('Magnitude Response of Inverse Chebyshev Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

% Plot phase response
subplot(3,1,2);
semilogx(f, angle(H));
title('Phase Response of Inverse Chebyshev Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Plot group delay response
subplot(3,1,3);
gd = -diff(angle(H))./diff(w);  % Group delay calculation
semilogx(f(2:end), gd);
title('Group Delay of Inverse Chebyshev Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Group Delay (samples)');
grid on;
