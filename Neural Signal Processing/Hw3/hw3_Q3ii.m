%Get parameters 
points_1 = [];
for i= 1:20 
    point = trial(i,1).x;
    points_1 = [points_1,[point]];
end 
points_1 = transpose(points_1);
P_C1 = 20/60;
mu_1 = transpose(mean(points_1));
points_1 = transpose(points_1);

points_2 = [];
for i= 1:20 
    point = trial(i,2).x;
    points_2 = [points_2,[point]];
end 
points_2 = transpose(points_2);
P_C2 = 20/60;
mu_2 = transpose(mean(points_2));
points_2 = transpose(points_2);

points_3 = [];
for i= 1:20 
    point = trial(i,3).x;
    points_3 = [points_3,[point]];
end 
points_3 = transpose(points_3);
P_C3 = 20/60;
mu_3 = transpose(mean(points_3));
points_3 = transpose(points_3);

sigma_1 = calc_Sk(points_1,mu_1);
sigma_2 = calc_Sk(points_2,mu_2);
sigma_3 = calc_Sk(points_3,mu_3);

%3e plot decision boundaries
x1_array = 0:0.2:20;
y1_array = 0:0.2:20;

[X,Y] = meshgrid(x1_array,y1_array);
figure;
for x = 1:101
    for y = 1:101
        point = [X(x,y);Y(x,y)];
        arg_C1 = -(1/2)*transpose(point)*inv(sigma_1)*point + transpose(mu_1)*inv(sigma_1)*point - (1/2)*transpose(mu_1)*inv(sigma_1)*mu_1 - (1/2)*log(det(sigma_1)) + log(20/60); 
        arg_C2 = -(1/2)*transpose(point)*inv(sigma_2)*point + transpose(mu_2)*inv(sigma_2)*point - (1/2)*transpose(mu_2)*inv(sigma_2)*mu_2 - (1/2)*log(det(sigma_2)) + log(20/60); 
        arg_C3 = -(1/2)*transpose(point)*inv(sigma_3)*point + transpose(mu_3)*inv(sigma_3)*point - (1/2)*transpose(mu_3)*inv(sigma_3)*mu_3 - (1/2)*log(det(sigma_3)) + log(20/60); 
        args = [arg_C1, arg_C2, arg_C3];
        [arg_max,C] = max(args);
        if C == 1 
            scatter(point(1),point(2),'MarkerEdgeColor',[1 0.7 0.7],'MarkerFaceColor',[1 0.7 0.7]);
        elseif C == 2
            scatter(point(1),point(2),'MarkerEdgeColor',[0.7 1 0.7],'MarkerFaceColor',[0.7 1 0.7]);
        elseif C == 3 
            scatter(point(1),point(2),'MarkerEdgeColor',[0.8 0.8 1],'MarkerFaceColor',[0.8 0.8 1]);
        end
        hold on;
    end
end

%plot class k=1 as red x 
for i = 1:20
    point = trial(i,1).x;
    x = point(1);
    y = point(2);
    scatter(x,y,'r','x')
    hold on
end

%plot class k=2 as green +  
for i = 1:20
    point = trial(i,2).x;
    x = point(1);
    y = point(2);
    scatter(x,y,'g','+')
    hold on
end

%plot class k=2 as blue o   
for i = 1:20
    point = trial(i,3).x;
    x = point(1);
    y = point(2);
    scatter(x,y,'b')
    hold on
end
title('2D-plot for Model ii')
axis([0 20 0 20])

%3c plot means
mean_x1 = mu_1(1);
mean_y1 = mu_1(2);
scatter(10.75,5.55,'r','filled')

mean_x2 = mu_2(1);
mean_y2 = mu_2(2);
scatter(mean_x2,mean_y2,'g','filled')

mean_x3 = mu_3(1);
mean_y3 = mu_3(2);
scatter(mean_x3,mean_y3,'b','filled')

%3d plot contours
x1_array = 0:0.2:20;
y1_array = 0:0.2:20;

[X,Y] = meshgrid(x1_array,y1_array);
F = mvnpdf([X(:) Y(:)],transpose(mu_1),sigma_1);
F = reshape(F,length(y1_array),length(x1_array));

hold on;
contour(X,Y,F,[0.007,0.007],'r');

[X,Y] = meshgrid(x1_array,y1_array);
F = mvnpdf([X(:) Y(:)],transpose(mu_2),sigma_2);
F = reshape(F,length(y1_array),length(x1_array));

hold on;
contour(X,Y,F,[0.007,0.007],'g');

[X,Y] = meshgrid(x1_array,y1_array);
F = mvnpdf([X(:) Y(:)],transpose(mu_3),sigma_3);
F = reshape(F,length(y1_array),length(x1_array));

hold on;
contour(X,Y,F,[0.007,0.007],'b');

function Sk = calc_Sk(points,mu)
    sum = 0;
    for n = 1:20
       x = points(:,n);
       sum = sum + (x-mu)*transpose(x-mu);
    end
    Sk = sum/20;
end
