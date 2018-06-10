%obtain initial parameters
muk = InitParams1.mu(); 
sigma = InitParams1.Sigma(); 
sigmak = cell(1,3);
sigmak{1}= sigma;
sigmak{2}= sigma;
sigmak{3}= sigma;
piek = InitParams1.pi(); 
xn = Spikes;

likelihood_array = [];
for i = 1:100
    gammank = E_step(xn,muk,sigmak,piek,3);
    [muk,sigmak,piek] = M_step(xn,gammank,3);
    likelihood = compute_likelihood(xn,muk,sigmak,piek,3);
    likelihood_array = [likelihood_array,likelihood];
end

figure;
plot([1:100],likelihood_array);
title("Data log likelihood vs. iteration");
xlabel("Iteration");
ylabel("Data log likelihood");

function aj = calculate_aj(x,mu,sigma,pie)
    aj = -1/2*log(det(sigma))-31/2*log(2*pi)-1/2*transpose(x-mu)*inv(sigma)*(x-mu)+log(pie);
end

%gammank is a 552 x 3 matrix 
function gammank = E_step(xn,muk,sigmak,piek,k_number)
    gammank = zeros(552,3);
    for n = 1:length(xn)
        %obtain max_aj
        ajk = [];
        for k = 1:k_number
            aj = calculate_aj(xn(:,n),muk(:,k),sigmak{k},piek(k));
            ajk = [ajk,aj];
        end
        max_aj = max(ajk);
        
        %obtain gamma
        for k = 1:k_number
            summ = 0;
            for j = 1:k_number
                summ = summ + exp(ajk(j)-max_aj);
            end
            gamma = exp(ajk(k) - max_aj + log(summ));
            gammank(n,k) = gamma;
        end
    end
end

function [muk,sigmak,piek] = M_step(xn,gammank,k_number)
    %calculate Nks 
    Nks = zeros(1,3);
    for k = 1:k_number
        Nks(k) = sum(gammank(:,k));
    end
    
    %calculate new muk
    muk = zeros(31,k_number);
    for k = 1:k_number
        summ = 0;
        for n = 1:length(gammank)
            summ = summ + gammank(n,k)*xn(:,n);
        end
        muk(:,k) = summ/Nks(k);
    end
    
    %calculate sigmak
    sigmak = cell(1,3);
    for k = 1:k_number
        summ = 0;
        for n = 1:length(xn)
            summ = summ + gammank(n,k)*(xn(:,n)-muk(:,k))*transpose(xn(:,n)-muk(:,k));
        end
        sigma = summ/Nks(k);
        sigmak{k} = sigma;
    end
    
    %calculate piek
    piek = zeros(1,3);
    for k = 1:k_number
        pie = Nks(k)/sum(sum(gammank));
        piek(k) = pie;
    end
end

function likelihood = compute_likelihood(xn,muk,sigmak,piek,k_number)
    likelihood = 0;
    for n = 1:length(xn)
        %obtain max_aj
        ajk = [];
        for k = 1:k_number
            aj = calculate_aj(xn(:,n),muk(:,k),sigmak{k},piek(k));
            ajk = [ajk,aj];
        end
        max_aj = max(ajk);
        
        summ = 0;
        for j = 1:k_number
        	summ = summ + exp(ajk(j)-max_aj);
        end
        likelihood = likelihood + max_aj + log(summ);
    end
end