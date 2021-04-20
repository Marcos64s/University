close all;clear all;clc;
%dados do problema
tmax=1000; N=30;
tdesp=500;
N1(1)=N;
for t=1:tmax
    pd=N1(t)/N;%prod de diminuir
    pa=1-N1(t)/N;%prod de aumentar    
    
    if rand()<=pd
        N1(t+1)=N1(t)-1;
    else
        N1(t+1)=N1(t)+1;
    end
end
t=0:tmax;
subplot(1,2,1)
plot(t,N1,'-k')
xlabel('t');ylabel('N1')
n1=0:N;
[h]=hist(N1(tdesp:end),n1);
h=h/sum(h);
subplot(1,2,2)
ps_t=factorial(N)./(factorial(n1).*factorial(N-n1))*2^(-N);
plot(n1,h,'xk',n1,ps_t,'r-')
xlabel('n1');ylabel('h(normalizado)')