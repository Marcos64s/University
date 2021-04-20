clear all
close all
xmax=20; xmin=0; %
nr=20; % numero de retangulos
lr=(xmax-xmin)/nr;
xr=xmin:lr:xmax;
p=inline('l^k*x.^(k-1).*exp(-l*x)/gamma(k)','k','l','x');

k=1; l=0.8;
x=0:0.01:xmax;
for i=1:nr
    ir=find(x>=xr(i) & x<= xr(i+1)); % indices do vetor x com x dentro do retangulo
    hr(i) = max(p(k,l,x(ir))); % valor maximo dentro do retangulo
end
plot(x,p(k,l,x),'b-')
hold on
for i=1:nr
    plot([xr(i), xr(i), xr(i+1), xr(i+1)], [p(k,l,xr(i)),hr(i), hr(i), p(k,l,xr(i+1)) ], 'r-');
end
% area dos retangulos
a=hr*lr; pr=a/sum(a);
Nxa=10000;
na=0;
nt=0;
while (na <Nxa)
    nt=nt+1; % numero de tentativas
    % escolher um retangulo
    ir=roleta(nr,pr);
    % gerar x e y uniformes dentro do retangulo.
    xa=xr(ir)+lr*rand(1); ya=hr(ir)*rand(1);
   
    % verificar se aceitamos
    if (ya <= p(k,l,xa) )
        %aceitamos
        na=na+1; 
        %plot(xa,ya,'k.')
        rx(na)=xa; % valor guardado do numero aleatorio gerado
    %else
     %   plot(xa,ya,'r.')
    end
    
end
ta=na/nt % taxa de numeros aceites
% calculo do histograma normalizado
nbins=100;
[h,x]=hist(rx,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(Nxa*dx); %histograma normalizado
plot(x,hn,'k.')




