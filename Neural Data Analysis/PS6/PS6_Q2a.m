proportion_correct = double.empty(0);
for i = 1:6 
    sum = 0;
    for j = 1:100
        response = MTdata(j,3,i);
        if response == 1;
            sum = sum + MTdata(j,3,i);
        end
    end
    temp_proportion_correct = sum/100;
    proportion_correct(i) = temp_proportion_correct;
end

params_guess = [1, 0.08];
params=nlinfit(coherence,proportion_correct,@psychometric_curve,params_guess);
corr_array = double.empty(0);
n = 0;
for s = 0:0.01:1
    n = n+1;
    y = psychometric_curve(params,s);
    corr_array(n) = y;
end

figure;
scatter(coherence,proportion_correct);
hold on;
plot(0:0.01:1,corr_array)
title('Psychometric Curve');
xlabel('Coherence%');
ylabel('Proportion Correct');
txt1 = 'Alpha = 0.1185';
txt2 = 'Beta = 3.266';
text(0.8,0.8,txt1);
text(0.8,0.78,txt2);