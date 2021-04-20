close all
clear all
clc

x = 0:0.1:12;
%h = [1:0.1:6 5.9:-0.1:0];
h=1.6;
A = 2;
p0=pi;
v=0.1;

for t=0:0.1:50 
    y = A*sin(2*pi*(x-v*t)/(h) + p0);
    y1= A*sin(2*pi*(x+v*t)/(h+0.2*h) + p0);
    y2= y+y1;
    plot(x,y,'-b',x,y1,'b--')
    hold on
    plot(x,y2,'-r','linewidth',3)
    hold off
    ylim([-2*A 2*A]);
    pause(0.1)
end