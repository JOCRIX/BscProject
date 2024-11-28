% Example: Design Inverse Chebyshev Filter
n = 3;             % Filter order
Rs = 60;           % Stopband ripple in dB

[z, p, k] = cheb2ap(n, Rs) % Get poles, zeros, and gain
[sos, g] = zp2sos(z, p, k) % Convert to second-order sections (optional)
[num, den] = zp2tf(z, p, k)  % Transfer function (numerator/denominator)

% Step 3: LC Synthesis (ladder network realization)
% Use numerical values from the denominator `den`
disp('Transfer function numerator (zeros):');
disp(num);
disp('Transfer function denominator (poles):');
disp(den);

%freqs(num,den)