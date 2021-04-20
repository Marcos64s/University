clear all
close all
clc
a=1; q=0.5;
%Simulaçao
M=10000; %numero de realizacoes
nmax=1000;
xmed=zeros(1,nmax);
Xn=zeros(1,M);
nbins=20;

for n=1:nmax
    for ir=1:M
        
        u=rand(1);
        if u<=q
            S=a;
        else
            S=-a;
        end
        
        Xn(ir)=Xn(ir)+S;
        
    end
    xmed(n)=sum(Xn)/M;
    if (mod(n,10)==0)
        [h,x]=hist(Xn,nbins);
        dx=(max(x)-min(x))/(nbins-1);
        hn=h/(sum(h)*dx);
        varx=4*q*(1-q)*n;xmt=(2*q-1)*a*n;
        pteorico=1/sqrt(2*pi*varx)*exp(-(x-xmt).^2/(2*varx));
        plot(x,hn,'kx',x,pteorico,'-r')
        pause(0.5)
    end
end