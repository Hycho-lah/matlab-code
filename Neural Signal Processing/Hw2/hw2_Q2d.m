%plot middle angle directions
subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k')
xlim([0 2])
ylim([0 2])
set(gca,'visible','off');

%plot k = 0
subplot(3,3,2);
histogram(spike_counts_per_angle{1},'Normalization','probability');
spike_counts = spike_counts_per_angle{1};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = 0');
xlim([0 100])
ylim([0 0.2])

%plot k = 1
subplot(3,3,3);
histogram(spike_counts_per_angle{2},'Normalization','probability');
spike_counts = spike_counts_per_angle{2};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = pi/4');
xlim([0 100])
ylim([0 0.2])

%plot k = 2
subplot(3,3,6);
histogram(spike_counts_per_angle{3},'Normalization','probability');
spike_counts = spike_counts_per_angle{3};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = pi/2');
xlim([0 100])
ylim([0 0.2])

%plot k = 3
subplot(3,3,9);
histogram(spike_counts_per_angle{4},'Normalization','probability');
spike_counts = spike_counts_per_angle{4};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = 3pi/4');
xlim([0 100])
ylim([0 0.2])

%plot k = 4
subplot(3,3,8);
histogram(spike_counts_per_angle{5},'Normalization','probability');
spike_counts = spike_counts_per_angle{5};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = pi');
xlim([0 100])
ylim([0 0.2])

%plot k = 5
subplot(3,3,7);
histogram(spike_counts_per_angle{6},'Normalization','probability');
spike_counts = spike_counts_per_angle{6};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = 5pi/4');
xlim([0 100])
ylim([0 0.2])

%plot k = 6
subplot(3,3,4);
histogram(spike_counts_per_angle{7},'Normalization','probability');
spike_counts = spike_counts_per_angle{7};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
ylabel('Normalized Distribution')
xlabel('Spike Counts')
title('Angle = 3pi/2');
xlim([0 100])
ylim([0 0.2])

%plot k = 7
subplot(3,3,1);
histogram(spike_counts_per_angle{8},'Normalization','probability');
spike_counts = spike_counts_per_angle{8};
spike_counts_normalized = spike_counts/sum(spike_counts);
lambda = poissfit(spike_counts);
x = 1:100;
y = poisspdf(x,lambda);
hold on;
plot(x,y);
xlabel('Spike Counts')
ylabel('Normalized Distribution')
title('Angle = 7pi/4');
xlim([0 100])
ylim([0 0.2])

