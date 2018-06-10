%collapse all ISIs into one array for each angle 
ISIs_distribution_per_angle = {};
for i = 1:8
    ISIs_distribution = [];
    ISI_set = ISI_sets{i};
    for t = 1:100
        ISIs = cell2mat(ISI_set(t));
        ISIs_distribution = [ISIs_distribution, ISIs];
    end
    ISIs_distribution_per_angle{i} = ISIs_distribution;
end

%plot middle angle directions
subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k')
xlim([0 2])
ylim([0 2])
set(gca,'visible','off');

%plot k = 0
subplot(3,3,2);
histogram(ISIs_distribution_per_angle{1},20,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{1};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 0');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 1
subplot(3,3,3);
histogram(ISIs_distribution_per_angle{2},20,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{2};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = pi/4');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 2
subplot(3,3,6);
histogram(ISIs_distribution_per_angle{3},20,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{3};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = pi/2');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 3
subplot(3,3,9);
histogram(ISIs_distribution_per_angle{4},20,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{4};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = 3pi/4');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 4
subplot(3,3,8);
histogram(ISIs_distribution_per_angle{5},20,'Normalization','probability');
ISIs_distribution = ISIs_distribution_per_angle{5};
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('Angle = pi');
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
title('Angle = 5pi/4');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 6
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
title('Angle = 3pi/2');
xlim([0 0.5]);
ylim([0 0.5]);

%plot k = 7
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
title('Angle = 7pi/4');
xlim([0 0.5]);
ylim([0 0.5]);







