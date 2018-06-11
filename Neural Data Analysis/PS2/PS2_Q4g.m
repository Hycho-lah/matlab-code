N = [4,8,16,32,64,128];
R = int32.empty(0,0);
distribution = double.empty(0,0);

MI = double.empty(0);
array = double.empty(0);
m_array = double.empty(0);
std_array = double.empty(0);
m = 0.0;
sd = 0.0;

for i = 1:length(N)
    Ni = N(i);
    for t = 1:1000
        for j = 1:Ni
              response = poissrnd(2);
              R(1,j) = response;
              response = poissrnd(4);
              R(2,j) = response;
              response = poissrnd(6);
              R(3,j) = response;
              response = poissrnd(8);
              R(4,j) = response;
        end

        for k = 1:100 
            distribution(1,k) = sum(R(1,:) == k);
            distribution(2,k) = sum(R(2,:)== k);
            distribution(3,k) = sum(R(3,:)== k);
            distribution(4,k) = sum(R(4,:)== k);
        end 
        distribution; % this is the distribution where rows represent S and columns represent R
        prob_distribution = distribution/Ni; % this yields the probability distribution

        prob_distributionS0 = prob_distribution(1,:);
        prob_distributionS45 = prob_distribution(2,:);
        prob_distributionS90 = prob_distribution(3,:);
        prob_distributionS135 = prob_distribution(4,:);

        prob_distributionS0(prob_distributionS0==0)=[];
        prob_distributionS45(prob_distributionS45==0)=[];
        prob_distributionS90(prob_distributionS90==0)=[];
        prob_distributionS135(prob_distributionS135==0)=[];

        H_RgivenS0 = 0.0;
        H_RgivenS45 = 0.0;
        H_RgivenS90 = 0.0;
        H_RgivenS135 = 0.0;

        for r = 1:length(prob_distributionS0)
            H_RgivenS0 = H_RgivenS0 + calculateEntropy(prob_distributionS0(r));
        end 

        for r = 1:length(prob_distributionS45)
            H_RgivenS45 = H_RgivenS45 + calculateEntropy(prob_distributionS45(r));
        end 

        for r = 1:length(prob_distributionS90)
            H_RgivenS90 = H_RgivenS90 + calculateEntropy(prob_distributionS90(r));
        end 

        for r = 1:length(prob_distributionS135)
            H_RgivenS135 = H_RgivenS135 + calculateEntropy(prob_distributionS135(r));
        end 

         H_RgivenS0 = H_RgivenS0*(-1.0);
         H_RgivenS45 = H_RgivenS45*(-1.0);
         H_RgivenS90 = H_RgivenS90*(-1.0);
         H_RgivenS135 = H_RgivenS135*(-1.0);

         H_RgivenS= double((H_RgivenS0 + H_RgivenS45 + H_RgivenS90 + H_RgivenS135)/4); 

         ResponseDistribution = sum(distribution);
         a = sum(ResponseDistribution); 
         ResponseProb_Distribution = ResponseDistribution/sum(ResponseDistribution);

         ResponseProb_Distribution(ResponseProb_Distribution==0)=[];

         H_Response = 0.0; 
         for r = 1:length(ResponseProb_Distribution) 
            H_Response = H_Response + calculateEntropy(ResponseProb_Distribution(r));
         end
         H_Response = H_Response*(-1); 

         MIi = H_Response - H_RgivenS; 
         array(t) = MIi;
    end
    m = mean(array);
    sd = std(array);
    m_array(i) = m;
    std_array(i) = sd;
end

figure; 
plot(N,m_array)
hold on;
plot([0,130],0.1*[1,1],'r:');
errorbar(N,m_array,std_array) 
xlabel('N');
ylabel('Mean of MI(R;S)');

function H = calculateEntropy(prob)
    H = double(prob*log2(prob));
end