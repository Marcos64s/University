% Exercício 30 
% Algoritmo de Demon
close all; clear all;clc;

npassos = 10000;
nequi = 1000;
N = 40;
i = 0;

% a) e c) --> sistema clássico
for E0=1:4:2*N+1
    i = i+1;
    [Emed(i),EDmed]=Osciladores_classicos(N,E0,npassos,nequi);
    %E_medio
    T(i)=EDmed; % dito no enunciado 
    
    fprintf(1,'E0=%f, T=%f, <E>=%f\n',E0,T(i),Emed)
end

T_teorico=0:0.1:2;
% kb = 1.38*10^(-23);
% R = 8.31;
E_teorico = N.*T_teorico;
plot(T,Emed,'r.',T_teorico,E_teorico,'k-')
xlabel('T')
ylabel('<E>')
legend('Resultado numérico','Valor teórico')
title('Energia média do sistema em função da temperatura')


%% b) e c) --> sistema quantico
close all; clear all;clc;

npassos = 10000;
nequi = 1000;
N = 40;
i = 0;

for E0=1:4:2*N+1
    i = i+1;
    [Emed,EDmed]=Osciladores_quanticos(N,E0,npassos,nequi);
    %E_medio
    Emedp(i)=Emed;
    T(i)=1./(log(1+1/EDmed)); % dito no enunciado 
    
    fprintf(1,'E0=%f, T=%f, <E>=%f\n',E0,T(i),Emed)
end
figure(2)
ET=N*(1/2+1./(exp(1./T)-1));
plot(T,ET,'k-',T,Emedp,'b.') 
legend('Teórico','Discreto')
xlabel('T'); 
ylabel('E(T)');