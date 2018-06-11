function [ final ] = apen( data, m, r )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
N=length(data);

for time=0:1
    m=m+time;
    C=zeros(1,N-m+1);
    for i=1:N-m+1
        for j=1:m
            x(i,j)=data(i+j-1);
        end
    end
    for i=1:N-m+1
        n=0;
        for k=1:N-m+1
            diff=max(abs(x(i,:)-x(k,:)));
            if diff<r
                n=n+1;
            end
        end
        C(i)=n/(N-m+1);
    end
    if time==0
        phi_m=sum(log(C))/(N-m+1);
    elseif time==1
        phi_m1=sum(log(C))/(N-m+1);
    end
end
final=phi_m-phi_m1;
end