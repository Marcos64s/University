close all;clear all;clc;

n=10;
k=rand(n,1);
%igamma = t^(nu-1)*exp(-t)
gama=igamma(k,n);
x=gammaincinv(gama,k,'lower');
plot(x,gama,'.k')