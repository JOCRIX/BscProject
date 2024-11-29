% Specifications
order = 5;                 % Filter order
cutoff_frequency = 2e6;    % -3 dB cutoff frequency in Hz
sampling_frequency = 10e6; % Sampling frequency in Hz
ripple_pass = 1;           % Passband ripple for Chebyshev and Elliptic filters in dB
ripple_stop = 40;          % Stopband ripple for Inverse Chebyshev and Elliptic filters in dB

% Normalized cutoff frequency (in the range [0, 1], where 1 is the Nyquist frequency)
Wn = cutoff_frequency / (sampling_frequency / 2);

% Design filters
[b_butter, a_butter] = butter(order, Wn, 'low');
[b_cheby2, a_cheby2] = cheby2(order, ripple_stop, Wn, 'low');
[b_ellip, a_ellip] = ellip(order, ripple_pass, ripple_stop, Wn, 'low');
[b_cheby1, a_cheby1] = cheby1(order, ripple_pass, Wn, 'low');
[b_bessel, a_bessel] = besself(order, Wn * pi);  % Bessel analog filter
[b_bessel, a_bessel] = bilinear(b_bessel, a_bessel, sampling_frequency); % Convert to digital

% Frequency response and group delay for all filters
[H_butter, f] = freqz(b_butter, a_butter, 1024, sampling_frequency);
[H_cheby2, ~] = freqz(b_cheby2, a_cheby2, 1024, sampling_frequency);
[H_ellip, ~] = freqz(b_ellip, a_ellip, 1024, sampling_frequency);
[H_cheby1, ~] = freqz(b_cheby1, a_cheby1, 1024, sampling_frequency);
[H_bessel, ~] = freqz(b_bessel, a_bessel, 1024, sampling_frequency);

% Group delay calculations
[gd_butter, ~] = grpdelay(b_butter, a_butter, 1024, sampling_frequency);
[gd_cheby2, ~] = grpdelay(b_cheby2, a_cheby2, 1024, sampling_frequency);
[gd_ellip, ~] = grpdelay(b_ellip, a_ellip, 1024, sampling_frequency);
[gd_cheby1, ~] = grpdelay(b_cheby1, a_cheby1, 1024, sampling_frequency);
[gd_bessel, ~] = grpdelay(b_bessel, a_bessel, 1024, sampling_frequency);

% PHASE, MAGNITUDE, and GROUP DELAY PLOT
figure;

% Magnitude response
subplot(3, 1, 1);
semilogx(f, 20*log10(abs(H_butter)), 'b', 'LineWidth', 1.5); % Butterworth in blue
hold on;
semilogx(f, 20*log10(abs(H_cheby2)), 'r--', 'LineWidth', 1.5); % Inverse Chebyshev in red dashed
semilogx(f, 20*log10(abs(H_ellip)), 'g-.', 'LineWidth', 1.5); % Elliptic in green dash-dot
semilogx(f, 20*log10(abs(H_cheby1)), 'm:', 'LineWidth', 1.5); % Chebyshev Type I in magenta dotted
semilogx(f, 20*log10(abs(H_bessel)), 'c-', 'LineWidth', 1.5); % Bessel in cyan solid
hold off;
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Butterworth', 'Inverse Chebyshev', 'Elliptic', 'Chebyshev Type I', 'Bessel');
grid on;
axis([1e5, sampling_frequency/2, -80, 5]); % Adjust for log scale

% Phase response
subplot(3, 1, 2);
semilogx(f, unwrap(angle(H_butter)), 'b', 'LineWidth', 1.5); % Butterworth in blue
hold on;
semilogx(f, unwrap(angle(H_cheby2)), 'r--', 'LineWidth', 1.5); % Inverse Chebyshev in red dashed
semilogx(f, unwrap(angle(H_ellip)), 'g-.', 'LineWidth', 1.5); % Elliptic in green dash-dot
semilogx(f, unwrap(angle(H_cheby1)), 'm:', 'LineWidth', 1.5); % Chebyshev Type I in magenta dotted
semilogx(f, unwrap(angle(H_bessel)), 'c-', 'LineWidth', 1.5); % Bessel in cyan solid
hold off;
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
legend('Butterworth', 'Inverse Chebyshev', 'Elliptic', 'Chebyshev Type I', 'Bessel');
grid on;

% Group delay response
subplot(3, 1, 3);
semilogx(f, gd_butter, 'b', 'LineWidth', 1.5); % Butterworth in blue
hold on;
semilogx(f, gd_cheby2, 'r--', 'LineWidth', 1.5); % Inverse Chebyshev in red dashed
semilogx(f, gd_ellip, 'g-.', 'LineWidth', 1.5); % Elliptic in green dash-dot
semilogx(f, gd_cheby1, 'm:', 'LineWidth', 1.5); % Chebyshev Type I in magenta dotted
semilogx(f, gd_bessel, 'c-', 'LineWidth', 1.5); % Bessel in cyan solid
hold off;
title('Group Delay');
xlabel('Frequency (Hz)');
ylabel('Group Delay (samples)');
legend('Butterworth', 'Inverse Chebyshev', 'Elliptic', 'Chebyshev Type I', 'Bessel');
grid on;
axis([1e5, sampling_frequency/2, 0, max([gd_butter; gd_cheby2; gd_ellip; gd_cheby1; gd_bessel])]); % Set axis limits
