train_set_structure = twod_scores_partitions;
train_set_structure{1} = []; 
train_set = [];
for s = 1:length(train_set_structure)
	train_set_partition = train_set_structure{s};
	train_set = [train_set; train_set_partition];
end

for K = 1:8
    newInitParams.sigma = sigma_array(:,:,1:K);
    newInitParams.mu = mu_array(:,1:K);
    pies = ones(1,K)*1/K;
    newInitParams.pi = pies;
    [mu, sigma, ppi] = func_GMM(newInitParams,transpose(train_set));
    muk_array{K} = mu;
    sigmak_array{K} = sigma;
    ppik_array{K} = ppi;
    disp(K);
end

%for K = 1 
K = 1;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(1);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 1");
xlabel("PC1");
ylabel("PC2");

%for K = 2 
K = 2;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 2");
xlabel("PC1");
ylabel("PC2");

%for K = 3
K = 3;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 3");
xlabel("PC1");
ylabel("PC2");

%for K = 4
K = 4;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 4");
xlabel("PC1");
ylabel("PC2");

%for K = 5
K = 5;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 5");
xlabel("PC1");
ylabel("PC2");

%for K = 6
K = 6;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 6");
xlabel("PC1");
ylabel("PC2");


%for K = 7
K = 7;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 7");
xlabel("PC1");
ylabel("PC2");


%for K = 8
K = 8;
muk = muk_array{K};
sigmak = sigmak_array{K};
figure(K);
scatter(score(:,1),score(:,2))
hold on 
for k = 1:K
    mu = muk(:,k);
    sigma = sigmak(:,:,k);
    func_plotEllipse(sigma,mu)
    hold on
end
title("K = 8");
xlabel("PC1");
ylabel("PC2");

