
%Turn each data point into spike counts for each of 97 neurons
FR_datapoints = {};
for n = 1:91
    for k = 1:8
        spike_count_array = [];
        for i = 1:97
            spikes = train_trial(n,k).spikes(i,351:550);
            spike_count = sum(spikes==1);
            spike_count_array = [spike_count_array;spike_count];
        end
        FR_datapoints(n,k) = {spike_count_array};
    end
end

lambda_array = [];
for k = 1:8
    sum_Xn = zeros(97,1);
    for n = 1:91
        Xn = cell2mat(FR_datapoints(n,k));
        sum_Xn = sum_Xn + Xn;
    end
    mu = sum_Xn/91.0;
    lambda_array = [lambda_array, mu];
end

%obtain datapoints for test trial 
FR_datapoints_test = {};
for n = 1:91
    for k = 1:8
        spike_count_array = [];
        for i = 1:97
            spikes = test_trial(n,k).spikes(i,351:550);
            spike_count = sum(spikes==1);
            spike_count_array = [spike_count_array; spike_count];
        end
        FR_datapoints_test(n,k) = {spike_count_array};
    end
end

%label each datapoint
FR_test_class = zeros(91,8);
for n = 1:91
    for k =1:8 
        test_point = cell2mat(FR_datapoints_test(n,k));
        args = [];
        for c = 1:8
            arg = get_arg_ak(lambda_array(:,c),test_point);
            args = [args, arg];
        end
        [arg_max,C] = max(args);
        FR_test_class(n,k) = C;
    end
end

%calculate percent correct 
number_correct = 0;
for k = 1:8
    for n = 1:91
        if FR_test_class(n,k) == k
            number_correct = number_correct + 1;
        end
    end
end
percent_correct = number_correct/(91*8);

function arg_ak = get_arg_ak(lambda,point)
    arg_ak = log(1/8);
    for i = 1:97
        arg_ak = arg_ak -(lambda(i));
        arg_ak = arg_ak + point(i)*log(lambda(i));
    end
end

