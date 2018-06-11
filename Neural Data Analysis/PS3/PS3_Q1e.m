X = [ones(size(sn)) sn ild];
[b,bint,r,rint,stats] = regress(spike_count,X);

