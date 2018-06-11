
MTdata_0 = MTdata(:,:,1);
MTdata_0Ll = double.empty(0);
MTdata_0Lr = double.empty(0);
for r = 1:100
    if MTdata_0(r,3) == 1 
        MTdata_0Lr(end+1) = MTdata_0(r,1);
    elseif MTdata_0(r,3) == 0
        MTdata_0Ll(end+1) = MTdata_0(r,1);
    end
end


[hist_Ll,edges_Ll] = histcounts(MTdata_0Ll,0:70);
[hist_Lr, edges_Lr] = histcounts(MTdata_0Lr,0:70);
hist_0L = double.empty(0,0);
hist_0L = [hist_Ll;hist_Lr];
figure;
bar(1:70,hist_0L');
title('Histogram for 0 coherence left neuron'); 
legend('Leftward choices','Rightward choices');
xlabel('Firing rate');

MTdata_0Rl = double.empty(0);
MTdata_0Rr = double.empty(0);
for r = 1:100
    if MTdata_0(r,3) == 1 
        MTdata_0Rr(end+1) = MTdata_0(r,2);
    elseif MTdata_0(r,3) == 0
        MTdata_0Rl(end+1) = MTdata_0(r,2);
    end
end

[hist_Rl,edges_Rl] = histcounts(MTdata_0Rl,0:70);
[hist_Rr, edges_Rr] = histcounts(MTdata_0Rr,0:70);
hist_0R = double.empty(0,0);
hist_0R = [hist_Rl;hist_Rr];
figure;
bar(1:70,hist_0R');
title('Histogram for 0 coherence right neuron'); 
legend('Leftward choices','Rightward choices');
xlabel('Firing rate');

AUROC_array = double.empty(0,0);
for c = 1:6
    MTdata_c = MTdata(:,:,c);
    
    MTdata_Ll = double.empty(0);
    MTdata_Lr = double.empty(0);
    for r = 1:100
        if MTdata_c(r,3) == 1 
            MTdata_Lr(end+1) = MTdata_c(r,1);
            MTdata_Ll(end+1) = 0;
        elseif MTdata_c(r,3) == 0
            MTdata_Ll(end+1) = MTdata_c(r,1);
            MTdata_Lr(end+1) = 0;
        end
    end
    MTdata_Rl = double.empty(0);
    MTdata_Rr = double.empty(0);
    for r = 1:100
        if MTdata_c(r,3) == 1 
            MTdata_Rr(end+1) = MTdata_c(r,2);
            MTdata_Rl(end+1) = 0;
        elseif MTdata_c(r,3) == 0
            MTdata_Rl(end+1) = MTdata_c(r,2);
            MTdata_Rr(end+1) = 0;
        end
    end
    
    TPR_L = MTdata_Lr/100;
    FPR_L = MTdata_Ll/100;
    
    TPR_R = MTdata_Rr/100;
    FPR_R = MTdata_Rl/100;
    
    ROC_L = double.empty(0,0);
    ROC_L(1,:) = FPR_L;
    ROC_L(2,:) = TPR_L;
    
    ROC_R = double.empty(0,0);
    ROC_R(1,:) = FPR_R;
    ROC_R(2,:) = TPR_R;
    
    ROC_L = sortrows(ROC_L',1)';
    ROC_R = sortrows(ROC_R',1)';
    
    AUROC_L = trapz(ROC_L(1,:),ROC_L(2,:));
    AUROC_R = trapz(ROC_R(1,:),ROC_R(2,:));
    
    AUROC_array(c,1) = AUROC_L;
    AUROC_array(c,2) = AUROC_R;
end

figure;
bar(AUROC_array);
title('AUROC histogram')
legend('Left Neuron','Right Neuron');
ylabel('Choice probability');
xlabel('Coherence')
set(gca,'xticklabel',{'0%','4%','8%','16%','32%','64%'})
mean_choices = mean(AUROC_array);