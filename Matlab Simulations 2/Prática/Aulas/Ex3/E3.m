close all;clear all;clc;

n=10^4;
nbins=30;
p=rand(n,1);

r=(4*(1-p)).^(-1/9);

[h,x]=hist(r,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(n*dx);
    
for i=1:length(x)
    if x(i)>=0 && x(i)<=1
        px(i)=(9/4)*(x(i)).^2;
    else
        px(i)=(9/4)*(x(i)).^(-10);
    end
end

title('densidade de probabilidade')
xlabel('r');
ylabel('p(r)')
plot(x,hn,'-b',x,px,'*r')

