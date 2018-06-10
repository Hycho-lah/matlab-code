twod_scores = score(:,1:2);

init_sigma = InitParams.Sigma; 
sigma_array = zeros(2,2,8);
for k = 1:8
    sigma_array(:,:,k) = init_sigma;
end
InitParams.sigma = sigma_array;
pies = ones(1,8)*1/8;
[InitParams.pi] = pies;
mu_array = InitParams.mu; 
%Partition scores by fold 1 - n = 1-138, fold 2 - n = 139-277
%fold 3 - n = 278-416, fold 4 - n = 416-552 

twod_scores_partitions{1} = twod_scores(1:138,:);
twod_scores_partitions{2} = twod_scores(139:277,:);
twod_scores_partitions{3} = twod_scores(278:416,:);
twod_scores_partitions{4} = twod_scores(416:552,:);


cv_likelihood_array = [];
for K = 1:8
    newInitParams.sigma = sigma_array(:,:,1:K);
    newInitParams.mu = mu_array(:,1:K);
    pies = ones(1,K)*1/K;
    newInitParams.pi = pies;
    likelihood_array = [];
    for f = 1:4
        train_set_structure = twod_scores_partitions;
        train_set_structure{f} = []; 
        train_set = [];
        for s = 1:length(train_set_structure)
           train_set_partition = train_set_structure{s};
           train_set = [train_set; train_set_partition];
        end
        test_set = twod_scores_partitions{f};
        [mu, Sigma, ppi] = func_GMM(newInitParams,transpose(train_set));
        likelihood = compute_likelihood(transpose(test_set),mu,Sigma,ppi,K);
        likelihood_array = [likelihood_array, likelihood];
    end
    muk_array{K} = mu;
    sigmak_array{K} = Sigma;
    cv_likelihood = mean(likelihood_array);
    cv_likelihood_array = [cv_likelihood_array,cv_likelihood];
end

figure(1)
plot([1:8],cv_likelihood_array)
xlabel("K");
ylabel("Cross-validated log likelihood");

function aj = calculate_aj(x,mu,sigma,pie)
    aj = -1/2*log(det(sigma))-31/2*log(2*pi)-1/2*transpose(x-mu)*inv(sigma)*(x-mu)+log(pie);
end

function likelihood = compute_likelihood(xn,muk,sigmak,piek,k_number)
    likelihood = 0;
    for n = 1:length(xn)
        %obtain max_aj
        ajk = [];
        for k = 1:k_number
            aj = calculate_aj(xn(:,n),muk(:,k),sigmak(:,:,k),piek(k));
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

