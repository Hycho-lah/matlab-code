

%plot spike train for k = 1
subplot(3,3,2);
trial_angle_target = trial(:,1);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end

    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 30pi/180')
xlabel('Time(ms)')

%plot spike train for k = 2
subplot(3,3,3);
trial_angle_target = trial(:,2);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end

    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 70pi/180')
xlabel('Time(ms)')

%plot spike train for k = 3
subplot(3,3,6);
trial_angle_target = trial(:,3);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end

    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 110pi/180')
xlabel('Time(ms)')

%plot spike train for k = 4
subplot(3,3,9);
trial_angle_target = trial(:,4);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 150pi/180')
xlabel('Time(ms)')

%plot spike train for k = 5
subplot(3,3,8);
trial_angle_target = trial(:,5);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 190pi/180')
xlabel('Time(ms)')

%plot spike train for k = 6
subplot(3,3,7);
trial_angle_target = trial(:,6);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end
    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 230pi/180')
xlabel('Time(ms)')

%plot spike train for k = 7
subplot(3,3,4);
trial_angle_target = trial(:,7);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end

    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 210pi/180')
xlabel('Time(ms)')

%plot spike train for k = 8
subplot(3,3,1);
trial_angle_target = trial(:,8);
spike_trains_five = trial_angle_target(1:5);
for i = 1:5 %plot first 5 spike trains 
    spike_train_structure = spike_trains_five(i);
    spike_train = spike_train_structure.spikes;
    for r = 1:length(spike_train)
        S = spike_train(r); %s = 1/0
        if S == 1 
            plot([r r],[i-1,i],'k')
            hold on;
        end

    end
end 
set(gca,'YTickLabel',[]);
ylim([0 5])
xlim([0 500])
title('Angle = 350pi/180')
xlabel('Time(ms)')

%plot middle angle directions
subplot(3,3,5);
hold on;
plot([0 2],[1 1],'k',[1 1],[0 2],'k',[0 2],[0 2],'k',[0 2],[2 0],'k')
xlim([0 2])
ylim([0 2])
set(gca,'visible','off');

