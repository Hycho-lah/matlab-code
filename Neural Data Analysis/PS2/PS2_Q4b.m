s0 = 0;
for r=0:100
    a = poisspdf(r,2)* log2(poisspdf(r,2));
    s0 = s0 + a;
end
s0 = s0*(-1);
    
s45 = 0;
for r=0:100
    a = poisspdf(r,4)* log2(poisspdf(r,4));
    s45 = s45 + a;
end
s45 = s45*(-1);

s90 = 0;
for r=0:100
    a = poisspdf(r,6)* log2(poisspdf(r,6));
    s90 = s90 + a;
end
s90 = s90*(-1);

s135 = 0;
for r=0:100
    a = poisspdf(r,8)* log2(poisspdf(r,8));
    s135 = s135 + a;
end
s135 = s135*(-1);
    