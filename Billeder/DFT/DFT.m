% Define parameters
N = 128;  % Number of DFT points

% Generate a random signal for demonstration
signal = randn(1, N);

% Compute DFT
X_k = fft(signal);

% Normalize the coefficients
X_k_norm = X_k ./ abs(X_k);

% Create a new figure
figure;
hold on;

% Plot the normalized DFT coefficients as red dots
plot(real(X_k_norm), imag(X_k_norm), 'ro');

% Set the axis limits to show the unit circle fully
axis([-1.5 1.5 -1.5 1.5]);

% Add grid lines for better visualization
grid on;

% Labels and title
xlabel('Real part');
ylabel('Imaginary part');
title('DFT Coefficients on Unit Circle');

% Draw the unit circle
th = 0:pi/50:2*pi;
xunit = cos(th);
yunit = sin(th);
plot(xunit, yunit, 'b');

% Ensure the plot is square
axis equal;

% Release the hold on the plot
hold off;