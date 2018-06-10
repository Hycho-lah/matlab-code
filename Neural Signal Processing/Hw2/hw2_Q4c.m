%compute counts of spikes
spike_counts_per_angle = {};
for i= 1:8
    spike_trains_structure = trial(:,i);
    count_spikes_trial = []; %number of spikes for each of 182 trials 
    for s = 1:182
        spike_train_structure = spike_trains_structure(s);
        spike_train = spike_train_structure.spikes;
        count_spikes = sum(spike_train);
        count_spikes_trial(end+1) = count_spikes;
    end
    spike_counts_per_angle{i} = count_spikes_trial;
end

s_array = [30*pi/180, 70*pi/180, 110*pi/180,150*pi/180, 190*pi/180,230*pi/180,310*pi/180,350*pi/180];
%plot spikes per angle
figure;
for i=1:8
    spike_counts_trial = spike_counts_per_angle{i};
    p = length(spike_counts_trial);
    for k = 1:p
        scatter(s_array(i),spike_counts_trial(k),'k');
        hold on;
    end
end
xlabel('Angle s');
ylabel('Spike Counts/s');
title('Tuning Curve');


%plot spike means per angle
mean_count_array = [];
for i = 1:8
    spike_counts = spike_counts_per_angle{i};
    mean_count = mean(spike_counts);
    mean_count_array(end+1) = mean_count;
end 
scatter(s_array,mean_count_array,'r','filled');
hold on;

y_array = [];
for s = 0:0.1:7
    l = get_lambda(s);
    y_array(end+1) = l;
end

plot([0:0.1:7],y_array,'g');

%Create a function that calculates lambda given s
function l = get_lambda(s)
    r_zero = 3.7;
    r_max = 6;
    s_max = 230*pi/180;
    l = r_zero + (r_max-r_zero)*cos(s-s_max);
end

