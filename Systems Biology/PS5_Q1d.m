deltaSignal = eeg - mean(eeg); 
T = 16; % 16-second period
fs = 50; % Sampling frequnecy = 50Hz
f = (1:801)*1/16; % Frequency vector

Signal_fft = fft(deltaSignal,length(deltaSignal)*1);
Signal_fft(1:31)=0;
Signal_fft(33:47)=0;
Signal_fft(49:95)=0;
Signal_fft(97:111)=0;
Signal_fft(113:127)=0;
Signal_fft(129:143)=0;
Signal_fft(145:271)=0;
Signal_fft(273:287)=0;
Signal_fft(289:end)=0;
%6Hz->data point 96,7Hz->112,9Hz->144,8Hz->128,2Hz->32,3Hz->48,18Hz->288, and 17Hz->272. 

inverse_fft = ifft(Signal_fft);
figure;
plot(f(1:400),inverse_fft(1:400));
ylabel('ifft')
xlabel('Frequency(Hz)')

