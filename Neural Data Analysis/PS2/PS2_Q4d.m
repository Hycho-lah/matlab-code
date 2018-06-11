s = 0;
for r=0:100
    a = poisspdf(r,5)* log2(poisspdf(r,5));
    s = s + a;
end
s = s*(-1);


    