figure;
plot(x_filtered);
title("Filtered Waveform");
xlabel("1/30000s");
ylabel("microV");
hold on
plot([0 300000],[250 250]);

threshold_crosses = [];
for i = 1:length(x_filtered)
    if x_filtered(i) >= 250 && x_filtered(i-1) < 250
        threshold_crosses(end+1) = i;
    end
end

%Each datapoint is 1/30000s or 1/30 ms. 
snippet_x = transpose([0:0.03333:1]);
figure;
for s = 1:length(threshold_crosses)
    cross = threshold_crosses(s);
    snippet_y = x_filtered(cross-10:cross+20);
    plot(snippet_x,snippet_y, 'black')
    hold on
end
plot([0 0.9999],[250 250])
title("Voltage vs. Time of Traces");
xlabel("ms");
ylabel("microV");
