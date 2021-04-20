clc;clear all;close all;
lambda=0.5;
t=0:10^2;
n=0:10;

w(t)=
pnt=(lambda.*t).^n./factorial(n).*exp(-lambda.*t);







xlabel('n')
ylabel('pnt')
zlabel('t')
title('Teórico')

