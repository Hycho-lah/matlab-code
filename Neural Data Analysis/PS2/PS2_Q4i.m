N = [4,8,16,32,64,128];
R = int32.empty(0,0);
MI_array = double.empty(0);
m_array = double.empty(0);
std_array = double.empty(0);

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
        lambdaS0 = mean(R(1,:)); %estimulates of lambda
        lambdaS45 = mean(R(2,:));
        lambdaS90 = mean(R(3,:));
        lambdaS135 = mean(R(4,:));
        
        H_RgivenS0 = 0.0;
        for r = 0:100 
            a = poisspdf(r,lambdaS0)* log2(poisspdf(r,lambdaS0));
            H_RgivenS0 = H_RgivenS0 + a;
        end
        H_RgivenS0 = H_RgivenS0*(-1);
        
        H_RgivenS45 = 0.0;
        for r = 0:100 
            a = poisspdf(r,lambdaS45)* log2(poisspdf(r,lambdaS45));
            H_RgivenS45 = H_RgivenS45 + a;
        end
        H_RgivenS45 = H_RgivenS45*(-1);
        
        H_RgivenS90 = 0.0;
        for r = 0:100 
            a = poisspdf(r,lambdaS90)* log2(poisspdf(r,lambdaS90));
            H_RgivenS90 = H_RgivenS90 + a;
        end
        H_RgivenS90 = H_RgivenS90*(-1);
       
        H_RgivenS135 = 0.0;
        for r = 0:100 
            a = poisspdf(r,lambdaS135)* log2(poisspdf(r,lambdaS135));
            H_RgivenS135 = H_RgivenS135 + a;
        end
        H_RgivenS135 = H_RgivenS135*(-1);
        
        H_RgivenS = (H_RgivenS0 + H_RgivenS45 + H_RgivenS90 + H_RgivenS135)/4.0; 
        
        H_Response = 0;
        for r=0:100
            a = poisspdf(r,5)* log2(poisspdf(r,5));
            H_Response = H_Response + a;
        end
        H_Response = H_Response*(-1);
        
        MIi = H_Response - H_RgivenS;
        MI_array(t) = MIi;
    end
    m = mean(MI_array);
    sd = std(MI_array);
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