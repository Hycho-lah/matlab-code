%the coefficient of variation, also known as relative standard deviation,
% is the ratio of the standard deviation to the mean. 

mean_array = [];
CV_array = [];
for i = 1:8
    ISIs_distribution = ISIs_distribution_per_angle{i};
    mean_ISI = mean(ISIs_distribution);
    CV_ISI = var(ISIs_distribution)/mean(ISIs_distribution);
    mean_array(end+1) = mean_ISI;
    CV_array(end+1) = CV_ISI;
end

figure; 
scatter(mean_array, CV_array);
hold on;
plot([0 0.3],[0 0.3],'k');
xlim([0 0.3]);
ylim([0 0.3]);
xlabel('Mean(s)');
ylabel('Cv');
title('Mean vs. Coefficient of Variation');