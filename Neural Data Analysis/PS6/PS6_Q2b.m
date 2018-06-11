nL_criterion = double.empty(0,0);
nR_criterion = double.empty(0,0);
for i = 1:6 
    data = MTdata(:,:,i);
    nL_percent_array = double.empty(0);
    nR_percent_array = double.empty(0);
    for c = 0:100 %criterion 
        nL = 0; 
        nR = 0;
        for r = 1:100 
            if data(r,1) > c
                nL = nL + 1;
            end
            if data(r,2) > c
                nR = nR +1;
            end
        end
        nL_percent = nL/100;
        nR_percent = nR/100;
        nL_percent_array(c+1) = nL_percent;
        nR_percent_array(c+1) = nR_percent;
    end
    nL_criterion(i,:)= nL_percent_array;
    nR_criterion(i,:) = nR_percent_array;
end

%Balanced Accuracy (TP/P + TN/N)/2

max_accuracy_array = double.empty(0);
for i = 1:6 
    data = MTdata(:,:,i);
    balanced_accuracy_array = double.empty(0);
    for b = 0:100
        TP = 0; 
        TN = 0;
        for r = 1:100 
            if data(r,1) < b && data(r,3) == 1
                TP = TP+1;
            end
            if data(r,1) > b && data(r,3) == 0
                TN = TN +1;
            end
        end
        data_to_rows = data(:,3)';
        P = 0;
        N = 0;
        for k = 1:100
            if data(k,3) == 1
                P = P+1;
            elseif data(k,3) == 0;
                N = N+1;
            end
        end
        balanced_accuracy = (TP/P + TN/N)/2;
        balanced_accuracy_array(b+1) = balanced_accuracy;
    end
   [max_accuracy,max_pos]  = max(balanced_accuracy_array);
   max_criterion_array(i) = max_pos-1;
end

criterion_l_array = double.empty(0);
criterion_r_array = double.empty(0);

for i = 1:6
    criterion = max_criterion_array(i);
    nL = 0; 
    nR = 0;
    data = MTdata(:,:,i);
    for r = 1:100 
        if data(r,1) > criterion
            nL = nL + 1;
        end
        if data(r,2) > criterion
        	nR = nR +1;
        end
   end
   nL_percent = nL/100;
   nR_percent = nR/100;
   criterion_l_array(i) = nL_percent;
   criterion_r_array(i) = nR_percent;
end


figure;
plot(nL_criterion(1,:),nR_criterion(1,:));
hold on;
plot(nL_criterion(2,:),nR_criterion(2,:));
hold on;
plot(nL_criterion(3,:),nR_criterion(3,:));
hold on;
plot(nL_criterion(4,:),nR_criterion(4,:));
hold on;
plot(nL_criterion(5,:),nR_criterion(5,:));
hold on;
plot(nL_criterion(6,:),nR_criterion(6,:));
title('ROC Curve');
xlabel('FPR');
ylabel('TPR');
scatter(criterion_l_array,criterion_r_array);
legend('0%','4%','8%','16%','32%','64%','Most accurate classifier')



