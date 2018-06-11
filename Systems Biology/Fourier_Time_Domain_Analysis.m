deltaHb = Hb - mean(Hb);
deltaHbO = HbO - mean(HbO);

mean_Hb = mean(Hb);
mean_HbO = mean(HbO);

time = (1:515)/fs;
figure;
plot(time,deltaHbO)
hold all;
plot(time,deltaHb)
xlabel('Time(s)')
ylabel('Mean-subtracted Concentration of oxyhemoglobin and deoxyhemoglobin(?M)')

figure; 
plot(time,blood_pressure)
ylabel('Blood Pressure(mmHg)')
xlabel('Time(s)')