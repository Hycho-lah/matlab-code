corrF = [];
muAxis = []; 

for k = -2:0.25:2 
    muAxis(end+1) = k;
    mu = i; 
    mu = [mu; mu];

    corrV = 0.9;

    sigma = [ 1 corrV; corrV 1];

    V = mvnrnd(mu,sigma,10000);

    sz = size(V);

    f1 = [0];
    f2 = [0];

    for  i = 1:sz(2)
        for j = 1:sz(1)
            if i == 1
                if V(j,i)>=0
                    f1(end+1) = V(j,i);
                else 
                    f1(end+1) = 0;
                end
            elseif i == 2 
                if  V(j,i)>=0
                    f2(end+1) = V(j,i);
                else 
                    f2(end+1) = 0;
                end
            end
        end
    end
    corr = corrcoef(f1,f2);
    corrF(end+1) = corr(1,2);
end         

figure
plot(muAxis,corrF);
xlabel('mu');
ylabel('corrF');