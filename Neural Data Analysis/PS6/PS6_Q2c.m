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


AUROC_array = double.empty(0);
for i = 1:6
    ROC = double.empty(0,0);
    ROC(1,:) = nL_criterion(i,:);
    ROC(2,:) = nR_criterion(i,:);
    ROC = sortrows(ROC',1)';
    AUROC = trapz(ROC(1,:),ROC(2,:));
    AUROC_array(i) = AUROC;
end

params_guess = [1, 0.08];
params=nlinfit(coherence,AUROC_array,@psychometric_curve,params_guess);
corr_array = double.empty(0);
n = 0;
for s = 0:0.01:1
    n = n+1;
    y = psychometric_curve(params,s);
    corr_array(n) = y;
end

figure;
scatter(coherence, AUROC_array);
title('Neurometric Curve');
xlabel('Coherence%');
ylabel('Proportion accurate');
hold on;
plot(0:0.01:1,corr_array)
txt1 = 'Alpha = 0.1592';
txt2 = 'Beta = 1.1732';
text(0.8,0.8,txt1);
text(0.8,0.78,txt2);