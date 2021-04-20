clear all
close all
a=1; q=0.5;
%Simulacao
M=100000; %numero de realizacoes
nmax=100;  nbins=10;
xmed=zeros(1,nmax);
Xn=zeros(1,M); % posição inicial de todas as realizações
for n=1:nmax % todos os passos
for ir=1:M %todas as realizacoes
     u=rand(1);
      if u<=q
            S=a;
        else
            S=-a;
      end
        Xn(ir)=Xn(ir)+S; %nova posicao da realizao ir da trajetoria
end

xmed(n)=sum(Xn)/M; % a media da posicao sobre todas as realizacoes no instante n
% fazer o histograma de 10 em 10 passos
if (mod(n,10)==0)
    [h,x]=hist(Xn,nbins); xmax=max(x); xmin=min(x);
    dx=(xmax-xmin)/(nbins-1);
    hn=h/sum(h)/dx;
    VarX=4*q*(1-q)*a^2*n; Xmt=(2*q-1)*a*n;
    xx=xmin:(xmax-xmin)/200:xmax;
    pteorico=1/sqrt(2*pi*VarX) *exp(-(xx-Xmt).^2/(2*VarX)); %esperado para n grande
    figure(1)
    plot(x,hn,'kx',xx,pteorico,'r-')
    xlabel('x') ; ylabel('p(x,n)')
    hmax=max(hn);
    text(2*xmax/3,2*hmax/3,['n=' num2str(n)]);
    drawnow
    pause(3)
end

end
figure(2)
n=1:nmax;
Xmt=(2*q-1)*a*n;
plot(n,xmed,'k.',n,Xmt,'r-')
xlabel('n')
ylabel('Xm(n)')
