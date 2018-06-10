
%Use this plot to find that maximum lambda = 50 
x_array = [0:0.001:1];
y_array = [];
for i = 0:0.001:1
    y = 30 +(50-30)*cos(i^(1/2)*pi - pi/2);
    y_array(end+1) = y;
end
figure;
plot(x_array,y_array);
xlabel('Time(s)');
ylabel('Lambda');