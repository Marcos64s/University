close all;clear all;clc;
xmax=15;xmin=0;
nr=1; % nº de retangulos
lr=(xmax-xmin)/nr;
xr=xmin:lr:xmax;
p = inline('l^ k* x.^(k-1).*exp(-l*x)/gamma(k-1)', 'k', 'l', 'x');

k=2;l=1;
x=0:0.01:xmax;
for i=1:nr
   ir=find(x>=xr(i) & x<=xr(i+1));%indices do vetor x com x dentro do retangulo
   hr(i)=max(p(k,l,x(ir)));    
end

plot(x,p(k,l,x),'b-')
hold on
for i=1:nr 
    plot([xr(i),xr(i),xr(i+1),xr(i+1)],[p(k,l,xr(i)),hr(i),hr(i),p(k,l,xr(i+1))],'r-');
end

%area do retangulo
a=hr*lr;pr=a/sum(a);

Nxa=1000;
na=0;
nt=0;
while(na<Nxa)
    %n de tentativas
    nt=nt+1;
    %escolher um retangulo
    ir=roleta(nr,pr);
    %gerar x e y uniformes no retangulo
    xa=xr(ir)+lr*rand(1);
    ya=hr(ir)*rand(1);
    %verificar se aceitamos
    if(ya<=p(k,l,xa))
        %aceitamos 
        na=na+1;
        rx(na)=xa;
        plot(xa,ya,'g.');
    else
        plot(xa,ya,'r.');
    end
end

Ta=Nxa/nt

nbins=100;
[h,x]=hist(rx,nbins);
xmax=max(x);xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(Nxa*dx);
hold on
plot(x,hn,'-k')