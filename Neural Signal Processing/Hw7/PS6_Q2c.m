gammank = E_step(xn,muk,sigmak,piek,3);

%plot k =1 
figure(1);
for n = 1:length(Spikes)
    gamman = gammank(n,:);
    k = find(gamman == max(gamman));
    disp(k);
    if k == 1
        plot([0:0.03333:1],Spikes(:,n),'black')
        hold on
    end
end
plot([0:0.03333:1],muk(:,1),'red','LineWidth',2);
SD_up = muk(:,1) + sqrt(diag(sigmak{1}));
SD_down = muk(:,1) - sqrt(diag(sigmak{1}));
plot([0:0.03333:1],SD_up,'red','LineStyle',':','LineWidth',2);
plot([0:0.03333:1],SD_down,'red','LineStyle',':','LineWidth',2);
title("k=1");
xlabel("ms");
ylabel("microV");

%plot k =2 
figure(2);
for n = 1:length(Spikes)
    gamman = gammank(n,:);
    k = find(gamman == max(gamman));
    if k == 2
        plot([0:0.03333:1],Spikes(:,n),'black')
        hold on
    end
end
plot([0:0.03333:1],muk(:,2),'red','LineWidth',2);
SD_up = muk(:,2) + sqrt(diag(sigmak{2}));
SD_down = muk(:,2) - sqrt(diag(sigmak{2}));
plot([0:0.03333:1],SD_up,'red','LineStyle',':','LineWidth',2);
plot([0:0.03333:1],SD_down,'red','LineStyle',':','LineWidth',2);
title("k=2");
xlabel("ms");
ylabel("microV");


%plot k =3 
figure(3);
for n = 1:length(Spikes)
    gamman = gammank(n,:);
    k = find(gamman == max(gamman));
    if k == 3
        plot([0:0.03333:1],Spikes(:,n),'black')
        hold on
    end
end
plot([0:0.03333:1],muk(:,3),'red','LineWidth',2);
SD_up = muk(:,3) + sqrt(diag(sigmak{3}));
SD_down = muk(:,3) - sqrt(diag(sigmak{3}));
plot([0:0.03333:1],SD_up,'red','LineStyle',':','LineWidth',2);
plot([0:0.03333:1],SD_down,'red','LineStyle',':','LineWidth',2);
title("k=3");
xlabel("ms");
ylabel("microV");

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
        Nk = 0;
        for n = 1:length(gammank)
            Nk = Nk + gammank(n,k);
        end
        Nks(k) = Nk;
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
            summ = summ + gammank(n,k)*(xn(:,n)-muk(k))*transpose(xn(:,n)-muk(k));
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