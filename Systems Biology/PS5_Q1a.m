signal = eeg; %1x801 array containing 16 seconds of data --> Data point is sampled every 0.02s
c = [];
for f = 1:1:25
    s = [];%create an empty array
    for t = 0:0.02:16
        sine = sin(2*pi*f*t);
        s(end+1)=sine;
    end
    r = xcorr(signal,s,'coeff');
    c(end+1) = max(r);
    [M,I] = max(c);
    maxF = I;
end
plot(1:1:25,c);
xlabel('Frequency(Hz)')
ylabel('Maximum Cross-Correlation')

