% Magnitude Response
figure;
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

% Phase Response
figure;
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

% Group Delay Response
figure;
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
