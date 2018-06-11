eye_hw5vel_new = {};
b0s = getfield(cosine_fit,'b0s');
Bs = getfield(cosine_fit,'Bs');
Bi = pinv(Bs);
Bt = transpose(Bs);
sigma = getfield(cosine_fit,'sigma');
sigmai = pinv(sigma);
inverse_argument = Bt*sigmai*Bs;
inverse_component = pinv(inverse_argument);

for i = 1:8
fr = spikes2{i}/dt;

fro = fr-b0s;

frT2 = double.empty(0,0);
for t = 1:length(spikes2{i}(1,:))
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
vbest = inverse_component*Bt*sigmai*frT2;
vbest = transpose(vbest);

vbest = num2cell(vbest);

eye_hw5vel_new{i} = vbest;
end