%Use K = 3

%project muk to 31 dimensional space 
ultimate_mu = transpose(mean(transpose(Spikes)));
muk = muk_array{3};
muk_projected_array = zeros(31,3);
muk_projected_array(:,1) = muk(1,1)*(coeff(:,1)*(-1))+ muk(2,1)*(coeff(:,2)*(-1))+ ultimate_mu;
muk_projected_array(:,2) = muk(1,2)*(coeff(:,1)*(-1))+ muk(2,2)*(coeff(:,2)*(-1))+ ultimate_mu;
muk_projected_array(:,3) = muk(1,3)*(coeff(:,1)*(-1))+ muk(2,3)*(coeff(:,2)*(-1))+ ultimate_mu;
sigmak = sigmak_array{3};
ppik = ppik_array{3};
xn = Spikes;

%plot canonical waveforms 
figure(1);
for k = 1:3
    plot([0:0.03333:1],muk_projected_array(:,1),'red')
    hold on 
    plot([0:0.03333:1],muk_projected_array(:,2),'green')
    plot([0:0.03333:1],muk_projected_array(:,3),'blue') 
end
title("Canonical Waveforms for K = 3");
xlabel("ms");
ylabel("microV");