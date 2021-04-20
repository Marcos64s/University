clear all
close all

% gerar numeros aleatórios com a distribuição de probabilidade
% p(r) = (9/4)*r^2 se 0 <= r <=1 ou (9/4)*r^-10 se 1 < r < inf

n=1e6;
nbins=100;
u = rand(n,1);

r = zeros(1,length(u));
for i=1:length(u)
   if u(i) <= 3/4
        r(i)=nthroot((4/3)*u(i),3);
   else
       r(i) = nthroot(1/(4*(1-u(i))),9);
   end
end
[h,x]=hist(r,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(n*dx); % normalizacao do h(x)
px=zeros(1,length(x));
for i=1:length(x)
    if x(i)<=1
        px(i) = (9/4)*x(i)^2;
    
    else
        px(i) = (9/4)*x(i)^(-10);
    end
end
plot(x,hn,'x',x,px,'r-')


