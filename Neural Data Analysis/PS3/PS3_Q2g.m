%Calculate MI(ILD,SN;R)
Z = [ild sn spike_count];
H=0; 

for i = 1:max(ild)
    for s = 1:max(sn)
        for r = 1:max(spike_count)
            sum_i_s_r = 0;
            for z = 1:length(spike_count)
                if Z(z,1)==i && Z(z,2) ==s && Z(z,3)==r
                     sum_i_s_r = sum_i_s_r +1;
                end
            end
            p_i_s_r = sum_i_s_r/length(spike_count);
            
            sum_i_s = 0;
            for z = 1:length(ild)
                if Z(z,1)==i && Z(z,2) ==s
                    sum_i_s = sum_i_s +1;
                end
            end
            p_i_s = sum_i_s/length(ild);

            sum_r = 0;
            for z = 1:length(spike_count)
                if Z(z,3)== r
                    sum_r = sum_r +1;
                end
            end
            p_r = sum_r/length(spike_count); 
            
            h = 0;
            if p_i_s_r ~= 0 && p_i_s ~= 0 && p_r ~= 0
                h = p_i_s_r*log2(p_i_s_r/(p_i_s*p_r));
            end
            H = H + h;
        end
    end
end
