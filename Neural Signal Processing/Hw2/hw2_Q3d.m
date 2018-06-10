%collapse all ISIs into one array for each angle 

ISIs_distribution = [];
for t = 1:100
    ISIs = ISIs_set{t};
    ISIs_distribution = [ISIs_distribution, ISIs];
end
  
%plot ISI distribution 
figure;
histogram(ISIs_distribution,20,'Normalization','probability');
mu = expfit(ISIs_distribution);
x = 0:0.01:1;
y = exppdf(x,mu);
y_normalized = y/sum(y); %normalize y
hold on;
plot(x,y_normalized);
ylabel('Normalized Distribution')
xlabel('ISI(s)')
title('ISI distribution for Inhomogeneous poisson process');
xlim([0 0.5]);
ylim([0 0.5]);
