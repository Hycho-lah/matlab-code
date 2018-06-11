

m_array = double.empty(0);
sd_array = double.empty(0);
for s = 1:5
    spike_count_ild = spike_count(find(ild==s));
    m = mean(spike_count_ild);
    sd = std(spike_count_ild);
    m_array(s) = m;
    std_array(s) = sd;
end

ild_axis = [1:5];
m_spike_count = mean(spike_count);
m_ild = mean(ild);

bILD_top = 0; 
for i = 1:length(spike_count)
    a = (ild(i)-m_ild)*(spike_count(i)-m_spike_count);
    bILD_top = bILD_top + a; 
end

bILD_bottom = 0;
for i = 1:length(spike_count)
    b = (ild(i)-m_ild)*(ild(i)-m_ild);
    bILD_bottom = bILD_bottom + b; 
end

bILD = bILD_top/bILD_bottom; 

b0 = m_spike_count - bILD*m_ild;

r_array = double.empty(0);
for s = 1:5 
    r_array(s)= b0 + bILD*s;
end

ild_reg = double.empty(0,0);
one = ones([2550,1]);
ild_reg(:,1) = one;
ild_reg(:,2) = ild;
[b,bint,r,rint,stats] = regress(spike_count, ild_reg);

figure; 
plot(ild_axis,m_array);
hold on;
plot(ild_axis,r_array);
errorbar(ild_axis,m_array,std_array) 
xlabel('SN');
ylabel('Mean Spike Count');
title(sprintf('R^2 = 0.0665; p-value = 5.33890822157007e-40'));



