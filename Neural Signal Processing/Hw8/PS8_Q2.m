figure(1);
x = Xsim(:,1);
y = Xsim(:,2);
scatter(x,y,'filled','black');
hold on; 
scatter(mean(x),mean(y),85,'filled','green')
[coeff,score,latent] = pca(Xsim);
plot([mean(x)-20*coeff(1,1),mean(x) mean(x)+20*coeff(1,1)],[mean(y)-20*coeff(2,1),mean(y) mean(y)+20*coeff(2,1)],'black');
Um = coeff(:,1);

mu = [mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim)]

Xprojected = transpose(Um*transpose(score(:,1))+transpose(mu));

x_proj = Xprojected(:,1);
y_proj = Xprojected(:,2);
scatter(x_proj,y_proj,'filled','red')

for i=1:8
    plot([Xprojected(i,1),Xsim(i,1)],[Xprojected(i,2),Xsim(i,2)],'red');
end
axis equal;
title("PC1 projections on 2D space");
xlabel("D=1");
ylabel("D=2");
