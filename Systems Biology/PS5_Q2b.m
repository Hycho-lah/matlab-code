autocorr_med = xcorr(hr_med,'coeff');
figure;
plot(autocorr_med);
xlabel('Lags(n)')
ylabel('Autocorrelation for heart rate after meditation');

figure;
autocorr_pre = xcorr(hr_pre,'coeff');
plot(autocorr_pre);
xlabel('Lags(n)')
ylabel('Autocorrelation for heart rate before meditation')