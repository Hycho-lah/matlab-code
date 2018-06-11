fr = spikes{2}/dt;
b0s = getfield(cosine_fit,'b0s');
Bs = getfield(cosine_fit,'Bs');
Bi = pinv(Bs);
fro = fr-b0s;

M = zeros([63 63]);
for n = 1:63
    x = Bs(n,1);
    y = Bs(n,2);
    m = sqrt(x*x + y*y);
    M(n,n) = m;
end
Mi = pinv(M);
P = double.empty(0,0);
P = Mi*Bs;
Pt = transpose(P);

vhat = Bi*fro; %could not get M and P to work in this prediction so used this alternative instead. 
vhat = transpose(vhat);

v = double.empty(0,0);
v = arm_vel{2};
plot_trajectory(v,vhat,'Predictions for T=1');


v = num2cell(v);
vhat = num2cell(vhat);
r2=evaluate_fit_2D(vhat,v);

r2array = double.empty(0);
for T = 1:10
    frT = double.empty(0,0);
    for t = 1:28
        bin = zeros([63 T]);
        for b = 1:T
            if t > (T-b)
                n = double.empty(0);
                n = fro(:,t-T+b);
                bin(:,b) = n;
            else
                bin(:,b) = fro(:,1);
            end
        end
        smoothed = mean(bin,2);
        frT(:,t) = smoothed;
    end

    vT = Bi*frT;
    vT = transpose(vT);
    vT = num2cell(vT);
    r2T=evaluate_fit_2D(vT,v);
    r2array(T) = r2T;
end

figure
plot(1:10, r2array);
xlabel('T');
ylabel('R^2');
title('T vs R^2');

frT2 = double.empty(0,0);
for t = 1:28
    bin = zeros([63 2]);
    for b = 1:2
        if t > (2-b)
            n = double.empty(0);
            n = fro(:,t-2+b);
            bin(:,b) = n;
        else
            bin(:,b) = fro(:,1);
        end
     end
     smoothed = mean(bin,2);
     frT2(:,t) = smoothed;
end

vbest = double.empty(0,0);
vbest = Bi*frT2;
vbest = transpose(vbest);
v = cell2mat(v);
plot_trajectory(v,vbest,'Predictions for T=2');

vbest = num2cell(vbest);
v = num2cell(v);
r2best=evaluate_fit_2D(vbest,v);