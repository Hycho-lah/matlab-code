signal = eeg(1:51); % Take first 1/0.02 (50) signals and autocorrelate
autocorr = xcorr(signal,'coeff');
plot(-50:1:50,autocorr);
xlabel('Lags(n)')
ylabel('Autocorrelation')