clear all
close all
n=1e6; lambda=1;
nbins=100;
u=rand(n,1);
y=-(1/lambda)*log(1-u);
[h,x]=hist(y,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(n*dx);
px=lambda*exp(-lambda*x);

u1=rand(n,1);
x1=-(1/lambda)*log(1-u1);
u2=rand(n,1);
x2=-(1/lambda)*log(1-u2);
y=x1+x2;
[hy,xx]=hist(y,nbins);
xmax=max(xx); xmin=min(xx);
dx=(xmax-xmin)/(nbins-1);
hyn=hy/(n*dx);
py=lambda^2*xx.*exp(-lambda*xx);

plot(x,hn,'x',x,px,'r-',xx,hyn,'kx',xx,py,'r-')
xlabel('x'); ylabel('p(x)');