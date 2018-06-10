%Initializations
muk = InitTwoClusters_1; 
%xn - each column represents a snippet, each row represents a sample of
%snippet
xn = zeros(31,length(threshold_crosses));
for s = 1:length(threshold_crosses)
    cross = threshold_crosses(s);
    xn(:,s) = x_filtered(cross-10:cross+20); 
end

%run iterations
figure;
J_array = [];
for i = 1:10
    rnk = E_step(xn, muk,2);
    J = calc_J(xn,rnk,muk,2);
    J_array(end+1) = J;
    scatter(i-0.5,J,'blue','o');
    hold on
    muk = M_step(xn,rnk,2);
    J = calc_J(xn,rnk,muk,2);
    J_array(end+1) = J;
    scatter(i,J,'red','o');
    hold on
end
plot([0.5:0.5:10],J_array,'black');
title("J vs. iteration");
xlabel("Iteration");
ylabel("J");

%plot k =1 
figure;
for snippet = 1:length(rnk(:,1))
    if rnk(snippet,1) == 1
        plot(snippet_x,xn(:,snippet),'black')
        hold on
    end
end
plot(snippet_x,muk(:,1),'red');
plot([0 0.9999],[250 250])
title("k=1");
xlabel("ms");
ylabel("microV");

%plot k = 2
figure;
for snippet = 1:length(rnk(:,2))
    if rnk(snippet,2) == 1
        plot(snippet_x,xn(:,snippet),'black')
        hold on
    end
end
plot(snippet_x,muk(:,2),'red');
plot([0 0.9999],[250 250])
title("k=2");
xlabel("ms");
ylabel("microV");

function rnk = E_step(xn, muk,ks)
    rnk = zeros(length(xn),ks);
    for s = 1:length(xn)
        distances = [];
        for k = 1:ks
            distance = (norm(xn(:,s)-muk(:,k)))^2;
            distances(end+1) = distance;
        end
        best_k = find(distances == min(distances));
        rnk(s,best_k) = 1;
    end
end

function muk = M_step(xn,rnk,ks)
    muk = zeros(31,ks);
    for k = 1:ks
        xn_n = zeros(31,1);
        for s = 1:length(xn)
            if rnk(s,k) == 1
                xn_n = xn_n + xn(:,s);
            end
        end
        muk(:,k) = xn_n/sum(rnk(:,k));
    end
end

function J = calc_J(xn,rnk,muk,ks)
    J = 0;
    for n = 1:length(xn)
        for k=1:ks
            xn_n = xn(:,n);
            muk_k = muk(:,k);
            rnk_nk = rnk(n,k);
            value = rnk_nk*(norm(xn_n-muk_k))^2;
            J = J + value;
        end
    end
end