clear all; close all; clc;
nequi=10^4; npassos=10^6;
Tv=[0.01:0.05:2];
xh=[-2:0.05:2];
ic=0;
for T=Tv
    ic=ic+1;
    
    [Emedio(ic)] = metropolis(T ,nequi, npassos,xh);

    fprintf(1,'Simulacao %d, T=%f, <E>=%f\n', ic, T, Emedio(ic));

    
end
figure(1)
plot(Tv, Emedio, 'r.')
xlabel('T')
ylabel('<E>')
