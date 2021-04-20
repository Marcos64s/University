clear all;close all;clc;
%% Defenição de Constantes
p=0.65;
nRondas=100;
w=[p 1-p];

%% Começo do Jogo
Dinheiro=zeros(1,nRondas);
Dinheiro(1)=2;%Dinheiro inicial

y = zeros(nRondas,1);
x = rand(nRondas,1);
y(x<w(1)) = 1;

wtot(1)=1;

for t=1:nRondas
    if y(t)==0
        xr=2;
    else
        xr=1;
    end
    wtot=wtot*w(xr);
end

%Teorico
w_analitico = 1+p*log2(p)+(1-p)*log2(1-p);


wtot(end)/w_analitico
