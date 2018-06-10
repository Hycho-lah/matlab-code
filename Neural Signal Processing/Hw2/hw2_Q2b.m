%collapse all 100 spike trains into one array for each angle
collapsed_spike_train_per_angle = {};
for i = 1:8
    m = spike_trains_per_angle{i};
    collapsed_spike_train = [];
    for t = 1:100
        spike_train = cell2mat(m(t));
        collapsed_spike_train = [collapsed_spike_train,spike_train];
    end
    collapsed_spike_train_per_angle{i} = collapsed_spike_train;
end

%count spikes for 0:0.02:1 s bins for each angle 
hist_per_angle = {};
for i = 1:8
    spike_counts_per_bin = [];
    for b = 0.02:0.02:1 
        bin_counts = 0;
        for s = 1:length(cell2mat(collapsed_spike_train_per_angle(i)))
            spike_train = cell2mat(collapsed_spike_train_per_angle(i));
            if spike_train(s) < b && spike_train(s)>= (b-0.02)
                bin_counts = bin_counts + 1;
            end
        end
        spike_counts_per_bin(end+1) = double(bin_counts/100); %this will take the average bin count for 100 spike trains, since I collapsed them earlier
    end
    hist_per_angle{i} = spike_counts_per_bin;
end

%define x-axis of histogram
x_array = [];
for x = 20:20:1000
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

% plot histogram for k = 0
subplot(3,3,2);
bar(x_array,hist_per_angle{1}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = 0');

% plot histogram for k = 1
subplot(3,3,3);
bar(x_array,hist_per_angle{2}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = pi/4');

% plot histogram for k = 2
subplot(3,3,6);
bar(x_array,hist_per_angle{3}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = pi/2');

% plot histogram for k = 3
subplot(3,3,9);
bar(x_array,hist_per_angle{4}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = 3pi/4');

% plot histogram for k = 4
subplot(3,3,8);
bar(x_array,hist_per_angle{5}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = pi');

% plot histogram for k = 5
subplot(3,3,7);
bar(x_array,hist_per_angle{6}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = 5pi/4');

% plot histogram for k = 6
subplot(3,3,4);
bar(x_array,hist_per_angle{7}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = 3pi/2');

% plot histogram for k = 7
subplot(3,3,1);
bar(x_array,hist_per_angle{8}*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
ylim([0 60]);
title('Angle = 7pi/4');