deltaSignal = eeg - mean(eeg); 
T = 16; % 16-second period
fs = 50; % Sampling frequnecy = 50Hz
f = (1:801)*1/16; % Frequency vector

Signal_fft = fft(deltaSignal,length(deltaSignal)*1);
Signal_magnitude = abs(Signal_fft);
Signal_phase = angle(Signal_fft)*360/(2*pi);

figure;
plot(f(1:400),Signal_magnitude(1:400));
xlabel('Frequency(Hz)')
ylabel('EEG Magnitude')

figure;
plot(f(1:400),Signal_phase(1:400));
xlabel('Frequency(Hz)')
ylabel('Phase(deg)')

