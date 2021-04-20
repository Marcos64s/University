clear all;close all;clc;
load dados_ex33_N200.mat
nmax=60;

Tt=transpose(linspace(Tc/10,Tmax,100));
Tt1=Tt(Tt<=Tc);
Tt2=Tt(Tt>2*Tc & Tt<=Tmax);

Et = N*Tc*0.7701*(Tt1/Tc).^(5/2);

EGI=3*N*Tt2/2;

Emed=Tc*0.7701*(T/Tc)^(5/2);


figure(1)
plot(Tv,Emedio-3*N/4,'kx',Tt1,Et,'r-',Tt2,EGI,'r-')
xlabel('T'); ylabel('<E>')
zGI=2.612*(Tc./Tt2).^(3/2);
