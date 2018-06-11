
delta_blood_pressure = blood_pressure - mean(blood_pressure);
blood_pressure_fft = fft(delta_blood_pressure);
blood_pressure_absfft = abs(blood_pressure_fft);

frequency = 0:0.01:2.5; 

blood_pressure_absfft_half = blood_pressure_absfft(1:1:251);


figure;
plot(frequency,blood_pressure_absfft_half);
xlabel('Frequency(Hz)')
ylabel('Blood Pressure(f)')