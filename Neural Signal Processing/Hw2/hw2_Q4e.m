%compute mean and variance of spike counts for each angle
spike_count_mean_array = [];
spike_count_variance_array = [];
for i = 1:8
    spike_counts = spike_counts_per_angle{i};
    spike_count_mean = mean(spike_counts);
    spike_count_variance = var(spike_counts);
    spike_count_mean_array(end+1) = spike_count_mean;
    spike_count_variance_array(end+1) = spike_count_variance;
end

%plot fano factor 
figure;
scatter(spike_count_mean_array,spike_count_variance_array);
hold on;
plot([0 10],[0 10],'k');
xlabel('Mean(spikes)')
ylabel('Variance(spikes)')
title('Fano Factor');
xlim([0 10]);
ylim([0 10]);