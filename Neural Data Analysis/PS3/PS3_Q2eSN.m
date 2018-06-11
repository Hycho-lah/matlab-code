%To calculate H(R|sn)
Z = [spike_count sn];
H=0; 

for i = 1:max(sn)
    for r = 1:max(spike_count)
        sum_r_i = 0;
        for z = 1:length(spike_count)
            if Z(z,1)==r && Z(z,2) ==i
                sum_r_i = sum_r_i +1;
            end
        end
        p_r_i = sum_r_i/length(spike_count);
        
        sum_i = 0;
        for z = 1:length(spike_count)
            if Z(z,2)==i
                sum_i = sum_i +1;
            end
        end
        p_i = sum_i/length(spike_count); 
        p_r_given_i = p_r_i/p_i;
        h = 0;
        if p_r_given_i ~= 0 
            h = p_r_i*log2(p_r_given_i)*(-1);
        end
        H = H + h;
    end
end

