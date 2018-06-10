
%Generate array of angles s - there are 8 angles total 
s_array = [];
for k = 0:7
    s = k*pi/4;
    s_array(end+1) = s;
end

%2a - Generate spike trains homogeneous poisson
%R = exprnd(mu) generates random numbers from the exponential distribution with mean parameter mu. 
%mu can be a vector, a matrix, or a multidimensional array. 
%The size of R is the size of mu.
%mu or mean of exponential distribution is 1/lambda
spike_trains_per_angle = {};
ISI_sets = {};
for i = 1:8 %for each angle
    s = s_array(i);
    lambda = get_lambda(s);
    spike_trains = {}; 
    ISI_set = {};
    for k = 1:100 
        spike_train = [];
        ISIs = [];
        T = 0; %duration of spike train
        while T <= 1 %creake spike for this spike train
            t = exprnd(1/lambda);
            T = T + t;
            if T > 1
                break
            end
            ISIs(end+1) = t;
            spike_train(end+1) = T;
        end
        spike_trains{k} = spike_train;
        ISI_set{k} = ISIs;
    end
    spike_trains_per_angle{i} = spike_trains; 
    ISI_sets{i} = ISI_set;
end


%plot spike train for k = 0
subplot(3,3,2);
spike_trains_target = spike_trains_per_angle{1};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 0')

%plot spike train for k = 1
subplot(3,3,3);
spike_trains_target = spike_trains_per_angle{2};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = pi/4')

%plot spike train for k = 2
subplot(3,3,6);
spike_trains_target = spike_trains_per_angle{3};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = pi/2')

%plot spike train for k = 3
subplot(3,3,9);
spike_trains_target = spike_trains_per_angle{4};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 3pi/4')

%plot spike train for k = 4
subplot(3,3,8);
spike_trains_target = spike_trains_per_angle{5};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = pi')

%plot spike train for k = 5
subplot(3,3,7);
spike_trains_target = spike_trains_per_angle{6};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 5pi/4')

%plot spike train for k = 6
subplot(3,3,4);
spike_trains_target = spike_trains_per_angle{7};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 3pi/2')

%plot spike train for k = 6
subplot(3,3,4);
spike_trains_target = spike_trains_per_angle{7};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 3pi/2')

%plot spike train for k = 7
subplot(3,3,1);
spike_trains_target = spike_trains_per_angle{8};
spike_trains_five = spike_trains_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train = spike_trains_five{i};
    for r = 1:length(spike_train)
        T = spike_train(r);
        plot([T T],[i-1,i],'k')
        hold on;
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
title('Angle = 7pi/4')

subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k')
xlim([0 2])
ylim([0 2])
set(gca,'visible','off');

%Create a function that calculates lambda given s
function l = get_lambda(s)
    r_zero = 30;
    r_max = 50;
    s_max = pi/2;
    l = r_zero + (r_max-r_zero)*cos(s-s_max);
end
