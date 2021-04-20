close all;clear all;clc;
%dados do problema
tmax=100; N=30;
tdesp=500;nrealiza=100;
N1med=zeros(tmax+1,1);

for real=1:nrealiza
    N1(1)=N;
    N1med(1)=N1med(1)+N1(1);
for t=1:tmax
    
    
    pd=N1(t)/N;%prod de diminuir
    pa=1-N1(t)/N;%prod de aumentar    
    
    if rand()<=pd
        N1(t+1)=N1(t)-1;
    else
        N1(t+1)=N1(t)+1;
    end
    N1med(t+1)=N1med(t+1)+N1(t+1);
end
    subplot(1,2,2)
    plot(0:tmax,N1)
    xlabel('t');ylabel('N1')
    hold on 
end

subplot(1,2,1)
N1med=N1med/nrealiza;
t=0:tmax;
N1med_t=N/2+(N-N/2)*exp(-t*log(1/(1-2/N)));
plot(t,N1med,'-k',t,N1med_t,'r.')
xlabel('t');ylabel('N1med')

