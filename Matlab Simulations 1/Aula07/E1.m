clear all;
close all;
clc;


x0 = -1;
p0 = [x0 10];
a = 4;
g = 10;
v = 2;

x = -2.5:0.1:2.5;
y = -a*x.^2+x.^4+6;
plot(x,y,'-')
hold on
ind = find(x==1);
plot(x(ind),y(ind),'or')
G = [2*a*x(ind)-4*x(ind)^3 1];
n = G./norm(G);

for t = [0:0.1:5]
   drop =6+v*t-(1/2)*(g*t^2);
   dropdist(t)
   if dropdist(t) == 0
        drop = atan(drop);  
   end
   plot(t,drop,'o')
   pause(0.1)
end