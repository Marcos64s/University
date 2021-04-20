close all; clear all;clc;
a=1;q=0.5;
%Simulação
M=1000;%numero de realizações
nmax=100;
for ir=1:M
    Xn(1)=0;
    for n=1:nmax
        u = rand(1);
        if u<=q
            S=a;
        else
            S=-a;
        end
        
        Xn(n+1)=Xn(n)+S;
    end
    plot(0:nmax,Xn,'-')
    hold on
end