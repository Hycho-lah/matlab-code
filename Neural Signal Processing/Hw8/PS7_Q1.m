
%plot raw voltage vs. time plot 
figure(1);
for n = 1:length(Spikes)
        plot([0:0.03333:1],Spikes(:,n),'black')
        hold on
end
title("Raw Voltage vs. Time");
xlabel("ms");
ylabel("microV");

%apply pca 
[coeff,score,latent] = pca(transpose(Spikes))

%plot eigenvector waveforms
figure(2);
plot([0:0.03333:1],coeff(:,1),'red')
hold on 
plot([0:0.03333:1],coeff(:,2),'green')
plot([0:0.03333:1],coeff(:,3),'blue')
title("Eigenvector waveforms");
xlabel("ms");
ylabel("Magnitude");

%plot square-rooted eigenvalue spectrum
figure(3);
plot([1:31],sqrt(latent))
title("Eigenvalue spectrum");
xlabel("Principle Component");
ylabel("Eigenvalue square-root");

%plot PC1 vs PC2 
figure(4);
score = score*(-1)
scatter(score(:,1),score(:,2))
hold on 
title("PC1 vs. PC2 Scatterplot");
xlabel("PC1");
ylabel("PC2");

