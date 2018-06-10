%collapse all 182 spike trains vertically for each angle
collapsed_spike_train_per_angle = {};
for i = 1:8
    spike_trains_structure = trial(:,i);
    collapsed_spike_train = zeros(1,500);
    for t = 1:182
        spike_train_structure = spike_trains_structure(t);
        spike_train = spike_train_structure.spikes;
        collapsed_spike_train = collapsed_spike_train + spike_train;
    end
    collapsed_spike_train_per_angle{i} = collapsed_spike_train;
end

%count spikes for 0:20:500 ms bins for each angle 
hist_per_angle = {};
for i = 1:8
    spike_counts_per_bin = [];
    for b = 20:20:500
        spike_train = cell2mat(collapsed_spike_train_per_angle(i));
        b1 = int16(b-20+1);
        b2 = int16(b);
        spike_train_bin = spike_train(b1:b2);
        bin_count = sum(spike_train_bin);%this will take the average bin count for 182 spike trains, since I collapsed them earlier
        spike_counts_per_bin(end+1) = bin_count/182.0; 
    end
    hist_per_angle{i} = spike_counts_per_bin;
end

%define x-axis of histogram
x_array = [];
for x = 20:20:500
    x_array(end+1) = x; 
end

%y-axis should be firing rate in spikes per second. For each bin now it
%shows the spikes per 20ms. To convert the value of bins appropriately, multiply each by 50.

%plot middle angle directions
subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k');
xlim([0 2]);
ylim([0 2]);
set(gca,'visible','off');

% plot histogram for k = 1
subplot(3,3,2);
bar(x_array,hist_per_angle{1}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 30pi/180');

% plot histogram for k = 2
subplot(3,3,3);
bar(x_array,hist_per_angle{2}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 70pi/180');

% plot histogram for k = 3
subplot(3,3,6);
bar(x_array,hist_per_angle{3}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 110pi/180');

% plot histogram for k = 4
subplot(3,3,9);
bar(x_array,hist_per_angle{4}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 150pi/180');

% plot histogram for k = 5
subplot(3,3,8);
bar(x_array,hist_per_angle{5}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 190pi/180');

% plot histogram for k = 6
subplot(3,3,7);
bar(x_array,hist_per_angle{6}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 230pi/180');

% plot histogram for k = 7
subplot(3,3,4);
bar(x_array,hist_per_angle{7}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 310pi/180');

% plot histogram for k = 8
subplot(3,3,1);
bar(x_array,hist_per_angle{8}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 50]);
title('Angle = 350pi/180');