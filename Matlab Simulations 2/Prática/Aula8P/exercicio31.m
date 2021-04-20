clear all
close all

% alinea a
N=1e3;
L=1; % Podemos  fixar  a densidade variando N e/ou L
V=L^3;
Nestados=1e4; % numero de estados para calculo das medias

Tv=linspace(0.1,10,10);
i=0;
for T=Tv
    i=i+1;
    [ Fluxo(i), erroF(i) , Pressao(i), erroP(i)] = fexercicio31( N,L, T,Nestados );
    
end

figure(1)
errorbar(Tv,Fluxo,erroF,'x');
T=0:0.01:10;
FluxoTeorico=(N/V)*sqrt(T/(2*pi));
hold on
plot(T,FluxoTeorico,'r-')
xlabel('T')
figure(2)
errorbar(Tv,Pressao,erroP,'x');
T=0:0.01:10;
PressaoTeorica=N*T/V; % P=(N/V) k_B T;
hold on
plot(T,PressaoTeorica,'r-')
xlabel('T')
ylabel('Pressao')