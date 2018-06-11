odefun= @(t,x)[0.01222*x(2)-(0.01222*(1-x(3))+0.13444*x(3)); (0.01222*(1-x(3))+0.13444*x(3))*x(1)-0.01222*x(2)+0.7-0.07*x(2); 0];

x1 = 90;
x2 = 10;
x3 = 1;

tspan1 = [0,18];
y01 = [x1,x2,x3];
[t1,y1] = ode45(odefun,tspan1,y01);


x1 = 1.057031255380689e+02; %initial conditions of x1 and x2 at time 18 hours 
x2 = 1.322242058038690e+02;
x3 = 0;

tspan2 = [18 45];
y02 = [x1 x2 x3];
[t2,y2] = ode45(odefun,tspan2,y02);

t1 = t1(1:end-1,:);
y1 = y1 (1:end-1,:);
t = [t1;t2];
y = [y1;y2];

yx1 = y(:,1);
yx2 = y(:,2);

plot(t,yx1,t,yx2);
xlabel('Time(hr)')
ylabel('Insulin Receptors(% total basal)')

