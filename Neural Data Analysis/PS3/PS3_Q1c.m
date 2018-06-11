
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

figure; 
plot(ild_axis,m_array)
hold on;
errorbar(ild_axis,m_array,std_array) 
xlabel('ILD');
ylabel('Mean Spike Count');


