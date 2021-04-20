clear all
close all
%clc
N=20;
nequi=10000; %para equilibracao; 
npassos=10000;%  para medias temporais
T=1.5;

%estudo em funçao da  densidade a T=1.5
fprintf(1,'Estudo em funçao da densidade\n')
fprintf(1,'T         Tobs      rho       Ep/N          press \n')
i=0;
for rho=[0.05,0.1:0.1:1]
    i=i+1;
    [Tobs,Ep,press]=fExercicio26(N,rho,T,nequi,npassos);
    
    fprintf(1,'% f %f  %f  %f  %f \n', T, Tobs, rho, Ep/N, press)
    rhov(i)=rho; Epv(i)=Ep; Tv(i)=Tobs; pressv(i)=press;
    drawnow
    pause(1)

end
figure(5)
% grafico da pressao e comparacao com gas ideal press=rho
pideal=rhov*T;
plot(rhov,pressv,'ro',rhov,pideal,'k-')
xlabel('rho')
ylabel('Pressao')
figure(6)
% grafico da energia interna por particula e  comparacao com gas ideal 
eideal=ones(1,length(rhov));eideal=eideal*3*T/2;
einterna=3*Tv/2+Epv/N;
plot(rhov,einterna,'ro',rhov,eideal,'k-')
xlabel('rho')
ylabel('E/N')
