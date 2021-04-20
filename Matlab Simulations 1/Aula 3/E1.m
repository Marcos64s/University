clear all
close all
clc


i = 0;
lados = 10;
radianos = (2*pi)/lados;
x = [0:radianos:2*pi];
M = [cos(x) -sin(x);sin(x) cos(x)];
while i < lados
    i = i + 1;
    hold on 
    plot([0 0],[0 0],[M(1, i) M(1, i+1)] ,[M(2, i) M(2, i+1)], '-');   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = 5;
raio = 1;

for t = 0:0.1:10
    rcm = [raio*cos(2*pi*t/T),raio*sin(2*pi*t/T)];
    plot(rcm(1),rcm(2),'.r', 'MarkerSize', 30)
    plot(M(1)+ rcm(1), M(2) + rcm(2))
 
    pause(0.1)
    xlim=[-1.1*raio 1.1*raio];
    ylim=[-1.1*raio 1.1*raio];
end
