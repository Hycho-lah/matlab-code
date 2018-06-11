
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

figure; 
plot(sn_axis,m_array)
hold on;
errorbar(sn_axis,m_array,std_array) 
xlabel('SN');
ylabel('Mean Spike Count');


