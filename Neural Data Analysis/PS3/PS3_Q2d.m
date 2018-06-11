
H_ILD = Entropy(ild);
H_SN = Entropy(sn);
H_R = Entropy(spike_count);

function H=Entropy(p)
prob_r_array = double.empty(0);
for r = 1:max(p)
    prob_r = sum(p(:) == r)/length(p);
    prob_r_array(r) = prob_r;
end
prob_r_array(prob_r_array==0) = []; % Make sure p is not zero, it will cause log(p) to be NaN.

H = 0;
for i = 1:length(prob_r_array)
    H_r = (prob_r_array(i)*log2(prob_r_array(i)))*(-1);
    H = H + H_r; 
end
end