clear all
close all
a=1; q=0.8;
%Simulaçao
M=10; %numero de realizacoes
nmax=100;
xmed=zeros(1,nmax);
for ir=1:M
Xn(1)=0; %posicao de partida

    for n=1:nmax
        xmed(n)=xmed(n)+Xn(n);
        u=rand(1);
        if u<=q
            S=a;
        else
            S=-a;
        end
        
        Xn(n+1)=Xn(n)+S;
    end
    plot(0:nmax, Xn)
    hold on
    xlabel('n'); ylabel('X');
end
xmed=xmed/M;
figure(2)
n=0:nmax-1;
plot(n,xmed,'k-',n,n*a*(2*q-1),'r-')
ylabel('Xmed'); xlabel('n')
