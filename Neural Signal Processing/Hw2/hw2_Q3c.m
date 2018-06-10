%compute counts of spikes
count_spikes_trial = []; %number of spikes for each of 100 trials 
for s = 1:100
    count_spikes = length(spike_trains{s});
    count_spikes_trial(end+1) = count_spikes;
end

figure;
%plot count distribution
histogram(count_spikes_trial,'Normalization','probability');
lambda = poissfit(count_spikes_trial);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Count Distribution for Inhomogeneous Poisson Process');
xlim([0 100])
ylim([0 0.1])
