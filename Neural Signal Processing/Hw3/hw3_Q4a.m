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

%Get parameters 
P_Ck = 1/8;
mu_array = [];
for k = 1:8
    sum_Xn = zeros(97,1);
    for n = 1:91
        Xn = cell2mat(FR_datapoints(n,k));
        sum_Xn = sum_Xn + Xn;
    end
    mu = sum_Xn/91.0;
    mu_array = [mu_array, mu];
end

sum_Sk = 0;
for k = 1:8
    points_k = FR_datapoints(:,k);
    mu = mu_array(:,k);
    Sk = calc_Sk(points_k,mu);
    sum_Sk = sum_Sk + Sk;
end
    
sigma = 1/8*sum_Sk;

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
            arg = get_arg_ak(mu_array(:,c),sigma,test_point);
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

function Sk = calc_Sk(points,mu)
    sum = 0;
    for n = 1:91
       x = cell2mat(points(n));
       sum = sum + (x-mu)*transpose(x-mu);
    end
    Sk = sum/91;
end

function arg_ak = get_arg_ak(mu,sigma,point)
    arg_ak = transpose(mu)*inv(sigma)*point-(1/2)*transpose(mu)*inv(sigma)*mu+log(1/8);
end

