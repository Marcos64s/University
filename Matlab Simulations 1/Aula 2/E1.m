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