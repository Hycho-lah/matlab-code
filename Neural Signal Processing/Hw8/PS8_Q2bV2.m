W = ones(2,1);
E_zx = ones(1,8);
cov_zx = 1;
Xn = Xsim;
mu = [mean(Xn)];
I = [1 0; 0 1];
sigma_sqr = [1 0; 0 1];

S = cov(Xn);

log_data_likelihood_array = []; 
for i = 1:100
    [E_zx, cov_zx,C] = E_step(Xn, mu, W,sigma_sqr);
    display(E_zx);
    
    [W_new, sigma_sqr_new] = M_step(Xn, mu,E_zx,cov_zx);
    display(E_zx);
    W = W_new;
    sigma_sqr = sigma_sqr_new;
    display(sigma_sqr)
    log_data_likelihood_sum = calc_likelihood(Xn,mu,W,sigma_sqr);
    log_data_likelihood_array = [log_data_likelihood_array log_data_likelihood_sum]; 
end

figure(1);
plot([1:100],log_data_likelihood_array);
title("PCCA EM Algorithm");
xlabel("iteration");
ylabel("log data likelihood");

figure(2);
x = Xsim(:,1);
y = Xsim(:,2);
scatter(x,y,'filled','black');
hold on
plot([mean(x)-2*W(1,1),mean(x) mean(x)+2*W(1,1)],[mean(y)-2*W(2,1),mean(y) mean(y)+2*W(2,1)],'black');
scatter(mean(x),mean(y),85,'filled','green');
mu_n = [mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim);mean(Xsim)];

Xprojected = transpose(W*E_zx+transpose(mu_n));
x_proj = Xprojected(:,1);
y_proj = Xprojected(:,2);
scatter(x_proj,y_proj,'filled','red')

for i=1:8
    plot([Xprojected(i,1),Xsim(i,1)],[Xprojected(i,2),Xsim(i,2)],'red');
end
axis equal;
title("PCCA projections on 2D space");
xlabel("D=1");
ylabel("D=2");

function log_data_likelihood_sum = calc_likelihood(Xn,mu,W,sigma_sqr)
    I = [1 0; 0 1];
    muk = mu;
    sigma = W*transpose(W)+sigma_sqr*I;
    log_data_likelihood_sum = 0;
    for n = 1:8 
        log_data_likelihood = -1/2*(Xn(n,:)-muk)*inv(sigma)*transpose(Xn(n,:)-muk)-1/2*log(det(sigma))-2/2*log(2*pi);
        log_data_likelihood_sum = log_data_likelihood_sum + log_data_likelihood;
    end
end

function [E_zx, cov_zx,C] = E_step(Xn, mu, W,sigma_sqr)
    I = [1 0; 0 1];
    %C_inv = sqrt(sigma_sqr)^(-2)*I-sqrt(sigma_sqr)^(-2)*W*inv(sigma_sqr*I+transpose(W)*W)*transpose(W);
    C = W*transpose(W)+sigma_sqr*I;
    C_inv = inv(W*transpose(W)+sigma_sqr*I);
    E_zx = transpose(W)*C_inv*transpose(Xn-mu);
    cov_zx = 1-transpose(W)*C_inv*W;
end

function [W_new, sigma_sqr_new] = M_step(Xn, mu,E_zx,cov_zx)
    W_new = (transpose(Xn-mu)*transpose(E_zx))*(cov_zx*8+E_zx*transpose(E_zx))^(-1);
    display(W_new)
    sigma_sqr_new = 1/(8*2)*trace(transpose(Xn-mu)*(Xn-mu)-W_new*E_zx*(Xn-mu));
    display(sigma_sqr_new)
end
