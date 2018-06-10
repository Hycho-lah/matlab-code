%collapse all 100 spike trains into one array for each angle
collapsed_spike_train = [];
for t = 1:100
    spike_train = spike_trains{t};
    collapsed_spike_train = [collapsed_spike_train,spike_train];
end

%count spikes for 0:0.02:1 s bins for each angle 
spike_counts_per_bin = [];
for b = 0.02:0.02:1 
    bin_counts = 0;
    for s = 1:length(collapsed_spike_train)
        spike_train = collapsed_spike_train;
        if spike_train(s) < b && spike_train(s)>= (b-0.02)
            bin_counts = bin_counts + 1;
        end
    end
    spike_counts_per_bin(end+1) = double(bin_counts/100); %this will take the average bin count for 100 spike trains, since I collapsed them earlier
end

%define x-axis of histogram
x_array = [];
for x = 20:20:1000
    x_array(end+1) = x; 
end

figure;
%y-axis should be firing rate in spikes per second. For each bin now it
%shows the spikes per 20ms. To convert the value of bins appropriately, multiply each by 50.
% plot histogram 
bar(x_array,spike_counts_per_bin*50);
ylabel('Firing Rate (Spikes/s)');
xlabel('time(ms)');
%ylim([0 60]);
title('Spike Histogram for Inhomogeneous Poisson Process');
hold on; 

%plot expected firing rate profile
x_array = [0:1:1000];
y_array = [];
for x = 0:0.001:1
    y = get_lambda_inhomogeneous(x);
    y_array(end+1) = y;
end
plot(x_array,y_array)

%Create a function that calculates lambda given T
function lambda = get_lambda_inhomogeneous(T)
    r_zero = 30;
    r_max = 50;
    s_max = pi/2;
    lambda = r_zero + (r_max-r_zero)*cos(T^(1/2)*pi - s_max);
end
