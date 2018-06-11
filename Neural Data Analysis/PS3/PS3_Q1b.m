
m_array = double.empty(0);
sd_array = double.empty(0);
for s = 1:5
    spike_count_sn = spike_count(find(sn==s));
    m = mean(spike_count_sn);
    sd = std(spike_count_sn);
    m_array(s) = m;
    std_array(s) = sd;
end

sn_axis = [1:5];
m_spike_count = mean(spike_count);
m_sn = mean(sn);

bSN_top = 0; 
for i = 1:length(spike_count)
    a = (sn(i)-m_sn)*(spike_count(i)-m_spike_count);
    bSN_top = bSN_top + a; 
end

bSN_bottom = 0;
for i = 1:length(spike_count)
    b = (sn(i)-m_sn)*(sn(i)-m_sn);
    bSN_bottom = bSN_bottom + b; 
end

bSN = bSN_top/bSN_bottom; 

b0 = m_spike_count - bSN*m_sn;

r_array = double.empty(0);
for s = 1:5 
    r_array(s)= b0 + bSN*s;
end


sn_reg = double.empty(0,0);
one = ones([2550,1]);
sn_reg(:,1) = one;sn
sn_reg(:,2) = sn;
[b,bint,r,rint,stats] = regress(spike_count, sn_reg);

figure; 
plot(sn_axis,m_array);
hold on;
plot(sn_axis,r_array);
errorbar(sn_axis,m_array,std_array) 
xlabel('SN');
ylabel('Mean Spike Count');
title(sprintf('R^2 = 0.0391; p-value = 6.54560563814578e-24'));



