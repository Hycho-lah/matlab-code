%3a - Generate spike trains homogeneous poisson
%R = exprnd(mu) generates random numbers from the exponential distribution with mean parameter mu. 
%mu can be a vector, a matrix, or a multidimensional array. 
%The size of R is the size of mu.
%mu or mean of exponential distribution is 1/lambda
%Generate homogenous poisson process with lambda_max = 50
%Generate 100 spikes trains 
%General roadmap: First generate 100 ISIs based on homogenous poisson, then get the Ts
%After obtaining the Ts(aka spike train) then perform rand rejection on
%array. Once new spike train is obtained, get ISIs again 
lambda_max = 50;
spike_trains = {}; 
for k = 1:100 
    spike_train = [];
    T = 0; %duration of spike train
    while T <= 1 %creake spike for this spike train
        t = exprnd(1/lambda_max);
        T = T + t;
        if T > 1
            break
        end
        spike_train(end+1) = T;
     end
     spike_trains{k} = spike_train;
end

%use random rejection
for q = 1:100
    spike_train = spike_trains{q};
    for j = 1:length(spike_train)
        if j > length(spike_train)
            break
        end
        T = spike_train(j);
        lambda_Tn = get_lambda_inhomogeneous(T);
        U = rand;
        if U > (lambda_Tn/lambda_max)
            spike_train([j]) = []; %reject spike at Tn 
        end
    end
    spike_trains{q} = spike_train;
end

%now compute the ISIs again 
ISIs_set = {};
for k = 1:100
    spike_train = spike_trains{k};
    ISIs = [spike_train(1)];
    for g = 2:length(spike_train)
        t = spike_train(g)-spike_train(g-1);
        ISIs(end+1) = t;
    end
    ISIs_set{k} = ISIs;
end

figure;
%plot 5 spike trains 
for i = 1:5
    spike_train = spike_trains{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end

set(gca,'YTickLabel',[]);
ylim([0 5])
title('Spikes trains for Inhomogeneous poisson process')
xlabel('Time(s)')

%Create a function that calculates lambda given T
function lambda = get_lambda_inhomogeneous(T)
    r_zero = 30;
    r_max = 50;
    s_max = pi/2;
    lambda = r_zero + (r_max-r_zero)*cos(T^(1/2)*pi - s_max);
end

