%first generate the ISIs
ISI_sets = {};
for i = 1:8
    spike_trains_structure = trial(:,i);
    ISI_set = {};
    for k = 1:182
        spike_train_structure = spike_trains_structure(k);
        spike_train = spike_train_structure.spikes;
        ISIs = [];
        t = 0;
        for a = 1:500
            if spike_train(a) ==0
                t = t+1;
            elseif spike_train(a) ==1
                ISIs(end+1) = t;
                t = 0;
            end
        end
        ISI_set{k} = ISIs;
    end
    ISI_sets{i} = ISI_set;
end


%collapse all ISIs into one array for each angle 
ISIs_distribution_per_angle = {};
for i = 1:8
    ISIs_distribution = [];
    ISI_set = ISI_sets{i};
    for t = 1:100
        ISIs = cell2mat(ISI_set(t));
        ISIs_distribution = [ISIs_distribution, ISIs];
    end
    ISIs_distribution_per_angle{i} = ISIs_distribution/1000; %convert ms to s
end


%plot middle angle directions
subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k')
xlim([0 2])
ylim([0 2])
set(gca,'visible','off');

%plot k = 1
subplot(3,3,2);
histogram(ISIs_distribution_per_angle{1},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{1};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 30pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 2
subplot(3,3,3);
histogram(ISIs_distribution_per_angle{2},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{2};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 70pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 3
subplot(3,3,6);
histogram(ISIs_distribution_per_angle{3},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{3};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 110pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 4
subplot(3,3,9);
histogram(ISIs_distribution_per_angle{4},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{4};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 150pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 5
subplot(3,3,8);
histogram(ISIs_distribution_per_angle{5},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{5};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 190pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 5
subplot(3,3,7);
histogram(ISIs_distribution_per_angle{6},30,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{6};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 230pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 7
subplot(3,3,4);
histogram(ISIs_distribution_per_angle{7},50,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{7};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 310pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 8
subplot(3,3,1);
histogram(ISIs_distribution_per_angle{8},40,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{8};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 350pi/180');
xlim([0 0.5]);
ylim([0 0.5]);

