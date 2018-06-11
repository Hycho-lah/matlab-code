% This is a function to estimate class labels based only on count data
% using a Poisson Naive Bayes decoder. 
%
% Usage: testLabels = poissonNBDecode(testCounts, classMeans, classPriors)
%
% Inputs: 
%
%   testCounts - a matrix of spike counts, where each column is a trial
%   and each row is a neuron. 
%
%   classMeans - a matrix, where the first column gives the mean counts for
%   class 1 and the second column gives the mean counts for class 2. 
%
%   classPriors - a vector where the first entry gives the prior
%   probability for class 1 and the second entry gives the prior
%   probability for class 2. 
%
% Outputs: 
%
%   testLabels - a vector, where testLabels(i) gives the estimated label for
%   trial i in testCounts. 
%

function testLabels = poissonNBDecode(testCounts, classMeans, classPriors)
   testLabels = double.empty(0);
   for t = 1:500 
        %Calculate numerator value for Class 1 
        class1_sumComponent = 0;
        for i = 1:5
            s = testCounts(i,t)*log(classMeans(i,1))-classMeans(i,1);
            class1_sumComponent = class1_sumComponent + s;
        end
        class1_num = log(classPriors(1)) + class1_sumComponent;

        %Calculate numerator value for Class 2 
        class2_sumComponent = 0;
        for i = 1:5
            s = testCounts(i,t)*log(classMeans(i,2))-classMeans(i,2);
            class2_sumComponent = class2_sumComponent + s;
        end
        class2_num = log(classPriors(2)) + class2_sumComponent;

        %Determine which Class is more probable 
        max_num = max(class1_num, class2_num);
        
        if max_num == class1_num
            testLabel = 1;
        else
            testLabel = 2;
        end
        
        testLabels(t) = testLabel;
    end
end
