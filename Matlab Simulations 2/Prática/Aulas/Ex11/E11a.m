close all;clear all;clc;
%dados do problema
N=10;
n=0:N;

b=1-n./N;
c=n./N;
c=c(2:end);
b=b(1:end-1);
p=diag(b,-1)+diag(c,1);

[V,D]=eig(p);
D=diag(D);
[D,is]=sort(D,'descend');
V=V(:,is);
pst=V(:,1)/sum(V(:,1));
sum(pst)

ps_t=factorial(N)./(factorial(n).*factorial(N-n))*2^(-N);
plot(n,pst,'rx',n,ps_t,'k.')
xlabel('n');ylabel('pst');