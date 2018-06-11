prob_sn_3 = sum(sn(:) == 3)/length(sn); 
spike_count_sn_3 = spike_count(find(sn==3));
prob_r_given_sn_3_his = double.empty(0);
for r = 1:max(spike_count)
    prob_r_and_sn_3 = sum(spike_count_sn_3(:) == r)/length(sn);
    prob_r_given_sn_3 = prob_r_and_sn_3/prob_sn_3;
    prob_r_given_sn_3_his(r) = prob_r_given_sn_3;
end

prob_sn_5 = sum(sn(:) == 5)/length(sn); 
spike_count_sn_5 = spike_count(find(sn==5));
prob_r_given_sn_5_his = double.empty(0);
for r = 1:max(spike_count)
    prob_r_and_sn_5 = sum(spike_count_sn_5(:) == r)/length(sn);
    prob_r_given_sn_5 = prob_r_and_sn_5/prob_sn_5;
    prob_r_given_sn_5_his(r) = prob_r_given_sn_5;
end

x = [1:max(spike_count)];
y = [prob_r_given_sn_3_his' prob_r_given_sn_5_his'];

bar(x,y);
hold on;
xlabel('r');
ylabel('Probability');
legend('p(r|sn = 3)','p(r|sn = 5)');
