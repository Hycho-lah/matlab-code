%compute counts of spikes
spike_counts_per_angle = {};
for i= 1:8
    spike_trains = spike_trains_per_angle{i};
    count_spikes_trial = []; %number of spikes for each of 100 trials 
    for s = 1:100
        count_spikes = length(cell2mat(spike_trains(s)));
        count_spikes_trial(end+1) = count_spikes;
    end
    spike_counts_per_angle{i} = count_spikes_trial;
end

%plot spikes per angle
figure;
for i=1:8
    spike_counts_trial = spike_counts_per_angle{i};
    p = length(spike_counts_trial);
    for k = 1:p
        scatter(i-1,spike_counts_trial(k),'k');
        hold on;
    end
end
xlabel('k for s = k*pi/4');
ylabel('Spike Counts/s');
title('Tuning Curve');

%plot spike means per angle
mean_count_array = [];
for i = 1:8
    spike_counts = spike_counts_per_angle{i};
    mean_count = mean(spike_counts);
    mean_count_array(end+1) = mean_count;
end 
scatter([0:7],mean_count_array,'r','filled');

y_array = [];
for k = 0:0.1:7
    s = compute_s(k);
    l = get_lambda(s);
    y_array(end+1) = l;
end

plot([0:0.1:7],y_array,'g');

%Create a function that calculates lambda given s
function l = get_lambda(s)
    r_zero = 30;
    r_max = 50;
    s_max = pi/2;
    l = r_zero + (r_max-r_zero)*cos(s-s_max);
end

function s = compute_s(k)
    s = k*pi/4;
end
