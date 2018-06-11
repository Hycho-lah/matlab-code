HbO_fft = fft(HbO);
Hb_fft = fft(Hb);

HbO_absfft = abs(HbO_fft);
Hb_absfft = abs(Hb_fft); 

frequency = 0:0.01:2.5; % 5Hz/515 =~ 0.01

HbO_absfft_half = HbO_absfft(1:1:251);
Hb_absfft_half = Hb_absfft(1:1:251);

figure;
plot(frequency,HbO_absfft_half);
xlabel('Frequency(Hz)')
ylabel('HbO(f)')

figure;
plot(frequency,Hb_absfft_half);
xlabel('Frequency(Hz)')
ylabel('Hb(f)')
