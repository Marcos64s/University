% Método de transformação das variáveis
% 1) Calcular F(y)
% 2) Inverter para obter y = F^(-1)(u)
% 3) Gerar u uniforme e calcular y = F^(-1)(u)
close all;clear all;clc;

n=10000;
nbins=100;
p=rand(n,1);

x=zeros(n,1);

for k = 1:length(p)
    if 0<=p(k)<=0.5
        x(k)=(5+sqr(4*p(k)-3))/2;
    else
        x(k)=(3+sqrt(2)*sqrt(p(k)))/2;
    end
end

[h,r]=hist(x,nbins);
rmax=max(r); rmin=min(r);
dr=(rmax-rmin)/(nbins-1);
hn=h/(n*dr);


% for k=1:length(p)
%     if 3/2<=x(k)<=2
%         px(k) = 2*(x(k)-3/2)^2;
%     elseif 2<=x(k)<=5/2
%         px(k) = 1-2*(x(k)-5/2)^2;
%     else
%         px(k) = 0;
%     end
% end


for k=1:length(p)
    if 3/2<=x(k)<=2
        px(k) = 4*(x(k)-3/2);
    elseif 2<=x(k)<=5/2
        px(k) = -4*(x(k)-5/2);
    else
        px(k) = 0;
    end
end
px=px';
plot(r,hn,'x',x,px,'r-')
