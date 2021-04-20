close all
clear all
clc

%Tarefa 3

a = [1,1]';
b = [1,-1]';
c = [2,-5];

A = [a,b]';
cor = inv(A)*c

Aa = A*a;
Ab = A*b;

quiver(0,0,a(1),a(2), 0, 'b')
hold on
quiver(0,0,b(1),b(2), 0 ,'k')
quiver(0,0,c(1),c(2), 0, 'r')
axis square
xlim([0 6])
ylim([-5 1])