% This is a function to learn the needed parameters for a two class 
% Naive Bayes decoder. 
%
% Usage: [classMeans, classPriors] = trainPoissonNBDecoder(trainCounts, trainLabels)
%
% Inputs: 
%
%   trainCounts - a matrix of spike counts, where each column is a trial
%   and each row is a neuron. 
%
%   trainLabels - a vector of labels for each trial (column) in
%   trainCounts. 
%
% Outputs: 
%
%   classMeans - a matrix, where the first column gives the mean counts for
%   class 1 and the second column gives the mean counts for class 2. 
%
%   classPriors - a vector where the first entry gives the prior
%   probability for class 1 and the second entry gives the prior
%   probability for class 2. 
%
function [classMeans, classPriors] = trainPoissonNBDecoder(trainCounts, trainLabels)

%Separate spike count matrix into several rows(neurons)

counts_n1 = trainCounts(1,:);
counts_n2 = trainCounts(2,:);
counts_n3 = trainCounts(3,:);
counts_n4 = trainCounts(4,:);
counts_n5 = trainCounts(5,:);

%Calculate class 1 means for each neuron 

counts_n1_class1 = counts_n1(find(trainLabels==1));
counts_n2_class1 = counts_n2(find(trainLabels==1));
counts_n3_class1 = counts_n3(find(trainLabels==1));
counts_n4_class1 = counts_n4(find(trainLabels==1));
counts_n5_class1 = counts_n5(find(trainLabels==1));

counts_class1 = [counts_n1_class1; counts_n2_class1; counts_n3_class1; counts_n4_class1; counts_n5_class1];

class1_means = mean(counts_class1,2);

% Calculate class 2 means for each neuron 

counts_n1_class2 = counts_n1(find(trainLabels==2));
counts_n2_class2 = counts_n2(find(trainLabels==2));
counts_n3_class2 = counts_n3(find(trainLabels==2));
counts_n4_class2 = counts_n4(find(trainLabels==2));
counts_n5_class2 = counts_n5(find(trainLabels==2));

counts_class2 = [counts_n1_class2; counts_n2_class2; counts_n3_class2; counts_n4_class2; counts_n5_class2];

class2_means = mean(counts_class2,2);

% Create classMeans output
classMeans = [class1_means, class2_means];

%Calculate class priors
class1_prior = sum(trainLabels==1)/500;
class2_prior = sum(trainLabels==2)/500;
classPriors = [class1_prior,class2_prior];

end
