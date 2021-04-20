clear all
close all
nequi=2000; nmedidas=10000;

%alinea b.
fprintf(1,' alinea b\n');
ic=0;
for E0=linspace(sqrt(2),80*sqrt(2),10);
 ic=ic+1;   
[Emedio,EDmedio]=fex28b(E0,nequi, nmedidas);

Em(ic)=Emedio; T(ic)=EDmedio-0.2; %0.2 é uma correção devido a que a Energia do Demon não 
%toma valores continuos mas discretos ED=0, sqrt(2), sqrt(5), sqrt(8),...
%
EmTeorico=1.20206*pi*T(ic)^3;
fprintf(1,'E0=%f, Emedio=%f, Eteor=%f, EDmedio=%f\n', E0,Emedio,EmTeorico,EDmedio);

end
Tv=[0:0.1:3];
EmTeorico=1.20206*pi*Tv.^3;
figure(2)
plot(T,Em,'.',Tv,EmTeorico,'k-')
xlabel('T'); ylabel('Emedio')

%% alinea c)

clear all
close all
nequi=2000; nmedidas=10000;

fprintf(1,' alinea c\n');
for E0=linspace(20*sqrt(2),80*sqrt(2),3);
 Ev=sqrt(2):0.1:E0;
 fprintf(1,'Calculos para E0=%f\n',E0);
 
[Emedio,EDmedio,Ebins,NmedioE]=fex28c(E0,nequi, nmedidas);
T=EDmedio-0.2;
NEteorico=(pi/2)*Ev./(exp(Ev/T)-1);
figure(3)
semilogy(Ebins,NmedioE,'.',Ev,NEteorico,'k-')
xlabel('E'); ylabel('Nfmedio(E)');
hold on
drawnow
end


