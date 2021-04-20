clear all
close all
nequi=2000; npassos=20000; nmedidas=npassos-nequi;
nmax=60;
N=200;
EF=(3*N/(4*pi))^(2/3);
TF=EF;

Tmax=2*TF;
Tv=linspace(TF/10,2*TF,30);
ic=0;
%%Descomentar para fazer Simulações
%  for T=Tv
%     ic=ic+1;
%     fprintf(1, 'Simulacao %d\n',ic)
%     
%     [Emedio(ic),E2medio(ic), nkmedio,EF2] = metropolis_ex35(T ,nequi, nmedidas,N, nmax);
%     mu(ic)=3/4+T*log(nkmedio(1)/(1-nkmedio(1)));
%    
%     fprintf(1,'T=%f, <E>=%f,  mu=%f\n', T, Emedio(ic)-3/4,  mu(ic));
%    
%     
%  end

% comparacao com expressoes teoricas
% para comparar com as expressoes teoricas a energia do estado fundamental
% e' subtraida de 3*N

% Descomentar para carregar dados
load dados_ex35_N200

TF2=EF2;
Tt=transpose(linspace(TF/100,Tmax,100));
Tt1=Tt(Tt<=0.5*TF);
Tt2=Tt(Tt>1.5*TF & Tt<=Tmax);

mut = EF*(1-pi^2/12*(Tt1/TF).^2);% valido para T<TF
Et = N*3*EF/5*(1+5*pi^2/12*(Tt1/TF).^(5/2)); % valido para T<TF
Cvt=N*(pi^2/2)*(Tt1/TF);% valido para T<TF

EGI=3*N*Tt2/2; % gas ideal clássico
muGI=Tt2.*log(4/(sqrt(pi)*3)*(TF./Tt2).^(3/2));

figure(1)
plot(Tv/(TF2-3/4),(Emedio-3*N/4)/(N*EF2),'kx',Tt1/TF,Et/(N*EF),'r-',Tt2/TF,EGI/(N*TF),'r-')
% subtrai-se 3N/4 porque tdos os estados de energia num sistema sem
% condicoes fronteira periodicas estao deslocados 3/4 de energia
% relativamente a um sistema com condicoes fronteira periodicas e as
% formulas teoricas assumem condicoes fronteira periodicas.

xlabel('T/TF'); ylabel('<E>/N')


figure(2)
plot(Tv/(TF2-3/4),mu/(EF2-3/4),'kx',Tt1/TF,mut/EF,'r-', Tt2/TF,muGI/EF,'r-')
xlabel('T/TF'); ylabel('mu/EF')


figure(3)
Cv=(E2medio-Emedio.^2)./Tv.^2; % calculo da capacidade termica

CvGI=3*N*ones(length(Tt2),1)/2; % Cv do gas ideal classico 
plot(Tv/(TF2-3/4),Cv/N,'k.',Tt1/TF,Cvt/N, 'r-',Tt2/TF,CvGI/N,'r-')
xlabel('T/TF'); ylabel('Cv/N')

%save dados_ex35_N200 
