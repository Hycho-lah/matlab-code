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