% Given values
Fs = 1 / 0.3;  % Sampling frequency in Hertz (1 / sampling interval)

% Your g_samples data
g_samples = [3, 2, 11, 12, 5, 6, 13, 9, 8, 0, 1, 3, 12, 16, 5, 7, 9, 4, 6, 5, 3, 2, 4, 3, 15, 9, 8, 4, 17, 18, 10, 12, 13, 8, 9, 2, 14, 16, 5, 10, 6, 9, 11, 3, 12, 14, 13];

% Calculate the Fourier transform of g_samples
N = length(g_samples);
frequencies = linspace(-Fs/2, Fs/2, N);
G_samples_f = fftshift(fft(g_samples, N) / N);

% Plot the magnitude spectrum
figure;
subplot(2, 1, 1);
stem(0:0.3:(length(g_samples)-1)*0.3, g_samples, 'Marker', 'none');
title('Sampled Signal in Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
plot(frequencies, abs(G_samples_f));
title('Magnitude Spectrum of Sampled Signal');
xlabel('Frequency (Hz)');
ylabel('|G_samples(f)|');
grid on;

% Adjust the figure layout
subplot(2, 1, 1);
sgtitle('Sampled Signal and its Fourier Transform');

% Display the plot