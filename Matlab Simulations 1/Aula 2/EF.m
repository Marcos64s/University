clear all
close all
clc

i = 0;
lados =10;
radianos = (2*pi)/lados;
x = [0:radianos:2*pi];
M = [cos(x) -sin(x);sin(x) cos(x)];
for t = [100 : -1 : 2]
    mudarox = M + cos(pi/4);
    while i < lados
        i = i + 1;
        y = [mudarox(1, i)*t mudarox(1, i+1)*t];
        z = [mudarox(2, i)*t mudarox(2, i+1)*t];
        hold on
        plot([0 0],[0 0],y,z, '-');
    end
    i = 0;
    pause(0.1)
    if t ~= 2
       %clf
    end
end