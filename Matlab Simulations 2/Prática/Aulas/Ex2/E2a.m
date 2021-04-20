close all;clear all;clc;
janelasx=2;
janelasy=1;
%% a
n=1e6;lambda=1;
nbins=100;
u=rand(n,1);
y=-(1/lambda)*log(1-u);
[h,x]=hist(y,nbins);
subplot(janelasy,janelasx,1)
xmax=max(x);xmin=min(x);
dx=(xmax-xmin)/nbins;
hn=h/(n*dx);
plot(x,hn,'x',x,lambda*exp(-lambda*x))
xlabel('X')
ylabel('Probabilidade(X)')

%% Mais do que 1

n=1e4;lambda=1;
nbins=100;
%criar 2
u1=rand(n,1);
u2=rand(n,1);
y1=-(1/lambda)*log(1-u1);
y2=-(1/lambda)*log(1-u2);
y=y1+y2;
%Dois histogramas
[h,x]=hist(y,nbins);
subplot(janelasy,janelasx,2)
xmax=max(x);xmin=min(x);
dx=(xmax-xmin)/nbins;
hn=h/(n*dx);
py=lambda^2*x.*exp(-lambda*x);
plot(x,hn,'x',x,lambda*exp(-lambda*x),x,py,'b-')
xlabel('X')
ylabel('Probabilidade(X)')

%% b
n=1e4;lambda=1;k=2;
nbins=100;
%criar 2
u1=rand(n,1);
u2=rand(n,1);
y1=-(1/lambda)*log(1-u1);
y2=-(1/lambda)*log(1-u2);
y=y1+y2;
a=rand(1,nbins);
randpoint=-(1/lambda)*log(1-a);
%Dois histogramas
[h,x]=hist(y,nbins);
xmax=max(x);xmin=min(x);
dx=(xmax-xmin)/nbins;
hn=h/(n*dx);
py=lambda^2*x.*exp(-lambda*x);


for z=1:100
    [maxpy,ind]=max(py);
tamanho=2*ind;

down=py(1:length(x)/tamanho:length(x));

 squaredfunc(z)=down(round(z/tamanho));
end

for d = 1:100
    if randpoint(d) <= hn(d)
        pontosok(d)=randpoint(d);
    else
        pontosok(d)=NaN;
    end
end

plot(x,hn,'x',x,py,'b-',x,pontosok,'r.',x,squaredfunc,'y-')
xlabel('X')
ylabel('Probabilidade(X)')