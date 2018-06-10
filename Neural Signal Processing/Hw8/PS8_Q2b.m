W = ones(2,1);
E_zx = ones(8,1);
cov_zx = ones(8,8);
Xn = transpose(Xsim);
mu = transpose([mean(Xn); mean(Xn); mean(Xn); mean(Xn);mean(Xn);mean(Xn);mean(Xn)]);
I = [1 0; 0 1];
sigma_sqr = ones(2,2);

S = cov(Xn);
figure(1);
log_data_likelihood_array = [];
for i = 1:50
    [E_zx, cov_zx] = E_step(Xn, mu, W,sigma_sqr);
    [W_new, sigma_sqr_new] = M_step(Xn, mu,E_zx,cov_zx);
    W = W_new;
    sigma_sqr = sigma_sqr_new;
    log_data_likelihood = calc_likelihood(Xn,mu,W,sigma_sqr);
    log_data_likelihood_array = [log_data_likelihood_array log_data_likelihood];
end

function log_data_likelihood = calc_likelihood(Xn,mu,W,sigma_sqr)
    I = [1 0; 0 1];
    muk = mu;
    sigma = W*transpose(W)+sigma_sqr*I;
    log_data_likelihood = -1/2*transpose(Xn-muk)*inv(sigma)*(Xn-muk)-1/2*log(det(sigma))-2/2*log(2*pi);
end

function [E_zx, cov_zx] = E_step(Xn, mu, W,sigma_sqr)
    I = [1 0; 0 1];
    %C_inv = sqrt(sigma_sqr)^(-2)*I-sqrt(sigma_sqr)^(-2)*W*inv(sigma_sqr*I+transpose(W)*W)*transpose(W);
    C_inv = sqrt(sigma_sqr)^(-2)*I-sqrt(sigma_sqr)^(-2)*W*inv(sigma_sqr*I+transpose(W)*W)*transpose(W);
    E_zx = transpose(W)*C_inv*(Xn-mu);
    cov_zx = I-transpose(W)*C_inv*W;
end

function [W_new, sigma_sqr_new] = M_step(Xn, mu,E_zx,cov_zx)
    W_new = ((Xn-mu)*transpose(E_zx))*inv(cov_zx+E_zx*inv(E_zx));
    sigma_sqr_new = 1/(8*2)*trace((Xn-mu)*transpose(Xn-mu)-Wnew*E_zx*transpose(Xn-mu));
end