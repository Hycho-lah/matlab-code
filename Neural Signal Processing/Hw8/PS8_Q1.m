%apply pca 
[coeff,score,latent] = pca(Xplan);

%plot square-rooted eigenvalue spectrum
figure(1);
plot([1:97],sqrt(latent))
title("Eigenvalue spectrum");
xlabel("Principle Component");
ylabel("Eigenvalue square-root");

display((latent(1)+latent(2)+latent(3))/sum(latent))

%plot PC space visualization for first 3 eigenvectors
X = score(:,1);
Y = score(:,2);
Z = score(:,3);
figure(2)
scatter3(X(1:91),Y(1:91),Z(1:91),'filled');
title("PC space visualization for first 3 eigenvectors");
xlabel("PC1");
ylabel("PC2");
zlabel("PC3");
hold on
scatter3(X(92:182),Y(92:182),Z(92:182),'filled');
scatter3(X(183:273),Y(183:273),Z(183:273),'filled');
scatter3(X(274:364),Y(274:364),Z(274:364),'filled');
scatter3(X(365:455),Y(365:455),Z(365:455),'filled');
scatter3(X(456:546),Y(456:546),Z(456:546),'filled');
scatter3(X(547:637),Y(547:637),Z(547:637),'filled');
scatter3(X(638:728),Y(638:728),Z(638:728),'filled');

%plot Um 
Um = zeros(97,3);
Um(:,1) = coeff(:,1);
Um(:,2) = coeff(:,2);
Um(:,3) = coeff(:,3);

figure(3);
imagesc(Um);
colorbar;
title("Um Matrix");
xlabel("Eigenvector");
ylabel("Neuron");

