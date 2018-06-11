prob_ild_3 = sum(ild(:) == 3)/length(ild); 
spike_count_ild_3 = spike_count(find(ild==3));
prob_r_given_ild_3_his = double.empty(0);
for r = 1:max(spike_count)
    prob_r_and_ild_3 = sum(spike_count_ild_3(:) == r)/length(ild);
    prob_r_given_ild_3 = prob_r_and_ild_3/prob_ild_3;
    prob_r_given_ild_3_his(r) = prob_r_given_ild_3;
end

prob_ild_5 = sum(ild(:) == 5)/length(ild); 
spike_count_ild_5 = spike_count(find(ild==5));
prob_r_given_ild_5_his = double.empty(0);
for r = 1:max(spike_count)
    prob_r_and_ild_5 = sum(spike_count_ild_5(:) == r)/length(ild);
    prob_r_given_ild_5 = prob_r_and_ild_5/prob_ild_5;
    prob_r_given_ild_5_his(r) = prob_r_given_ild_5;
end

x = [1:max(spike_count)];
y = [prob_r_given_ild_3_his' prob_r_given_ild_5_his'];

bar(x,y);
hold on;
xlabel('r');
ylabel('Probability');
legend('p(r|ild = 3)','p(r|ild = 5)');
