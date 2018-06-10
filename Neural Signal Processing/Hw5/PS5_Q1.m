x = RealWaveform;
figure;
plot(x)
title("Real Waveform");
xlabel("1/30000s");
ylabel("microV");

f_0 = 30000; %sampling rate of waveform(Hz)
f_stop = 250; % stop frequency(Hz)
f_Nyquist = f_0/2; % Nyquist limit
n = length(x);
f_all = linspace(-f_Nyquist, f_Nyquist,n);
desired_response = ones(n,1);
desired_response(abs(f_all)<=f_stop)=0;
x_filtered = real(ifft(fft(x).*fftshift(desired_response)));
figure;
plot(x_filtered);
title("Filtered Waveform");
xlabel("1/30000s");
ylabel("microV");

sound(x*.97/max(abs(x)),f_0);