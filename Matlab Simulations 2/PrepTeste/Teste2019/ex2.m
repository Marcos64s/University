clear all
close all
clc
nequi=2000; nmedidas=20000;
i=0;Tv=[0:0.1:3];
delta=0.2;

% alinea 2. c)
for E0=sqrt(2):10*sqrt(2):80*sqrt(2);
    i=i+1;
 [Emed,Edmed, nmax]=fex2(E0,nequi,nmedidas);
 T(i)=Edmed-delta;
 E(i)=pi*T(i).^3*1.20206;

 fprintf(1,'E0=%f ,nmax=%d, T=%f,  <E>=%f\n',E0,nmax,T(i), E(i))
 
end

ET=pi*Tv.*Tv.*Tv*1.20206;

plot(Tv,ET,'.k',T,E,'.r')
legend('Teorica','Discreta')