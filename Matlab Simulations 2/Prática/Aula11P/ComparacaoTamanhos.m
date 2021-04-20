clear all
close all
warning off
legenda='';
for i=1:3
    switch i
        case 1 
            load dados_ex35_N200
            marker='kx';
            legenda=[legenda;'N=200'];
           
        case 2 
            load dados_ex35_N400
            marker='ko';
            legenda=[legenda; 'N=400'];
           
        case 3 
            load dados_ex35_N800
            marker='ks';
            legenda=[legenda ;'N=800'];
           
    end
            

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
plot(Tv/(TF2-3/4),(Emedio-3*N/4)/(N*EF2),marker)
hold on
plot(Tt1/TF,Et/(N*EF),'r-',Tt2/TF,EGI/(N*TF),'r--','HandleVisibility','off')
% subtrai-se 3N/4 porque tdos os estados de energia num sistema sem
% condicoes fronteira periodicas estao deslocados 3/4 de energia
% relativamente a um sistema com condicoes fronteira periodicas e as
% formulas teoricas assumem condicoes fronteira periodicas.

xlabel('T/TF'); ylabel('<E>/(N TF)')
legend(legenda,'Location','NorthWest')

figure(2)
plot(Tv/(TF2-3/4),mu/(EF2-3/4),marker)
hold on
plot(Tt1/TF,mut/EF,'r-', Tt2/TF,muGI/EF,'r--','HandleVisibility','off')
legend(legenda,'Location','NorthEast')
xlabel('T/TF'); ylabel('mu/EF')


figure(3)
Cv=(E2medio-Emedio.^2)./Tv.^2; % calculo da capacidade termica

CvGI=3*N*ones(length(Tt2),1)/2; % Cv do gas ideal classico 
plot(Tv/(TF2-3/4),Cv/N,marker)
hold on
plot(Tt1/TF,Cvt/N, 'r-',Tt2/TF,CvGI/N,'r--','HandleVisibility','off')
xlabel('T/TF'); ylabel('Cv/N')
legend(legenda,'Location','NorthEast')



end
