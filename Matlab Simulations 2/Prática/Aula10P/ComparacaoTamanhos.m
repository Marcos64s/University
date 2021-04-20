clear all
close all
warning off
legenda='';
for i=1:3
    switch i
        case 1 
            load dados_ex33_N200
            marker='kx';
            legenda=[legenda;'N=200'];
           
        case 2 
            load dados_ex33_N400
            marker='ko';
            legenda=[legenda; 'N=400'];
           
        case 3 
            load dados_ex33_N800
            marker='ks';
            legenda=[legenda ;'N=800'];
           
    end
            

Tt=transpose(linspace(Tc/10,Tmax,100));
Tt1=Tt(Tt<=Tc);
Tt2=Tt(Tt>2*Tc & Tt<=Tmax);

zt = ones(numel(Tt1),1);

Et = N*Tc*0.7701*(Tt1/Tc).^(5/2); % valido para T<Tc

EGI=3*N*Tt2/2; % gas ideal clássico

figure(1)
plot(Tv/Tc,(Emedio-3*N/4)/(N*Tc),marker)
hold on

xlabel('T/Tc'); ylabel('<E>/(N Tc)')
plot(Tt1/Tc,Et/(N*Tc),'r-',Tt2/Tc,EGI/(N*Tc),'r--','HandleVisibility','off')
legend(legenda,'Location','NorthWest')

figure(2)
zGI=2.612*(Tc./Tt2).^(3/2);
plot(Tv/Tc,z,marker)
xlabel('T/Tc'); ylabel('z')
hold on
plot(Tt1/Tc,zt,'r-', Tt2/Tc,zGI,'r--','HandleVisibility','off')
legend(legenda,'Location','NorthEast')


figure(3)
f0t=1-(Tt1/Tc).^(3/2);
plot(Tv/Tc,f0,marker')

xlabel('T/Tc'); ylabel('f0')
hold on
plot(Tt1/Tc,f0t,'r-','HandleVisibility','off')
legend(legenda,'Location','NorthEast')



figure(4)
Cv=(E2medio-Emedio.^2)./Tv.^2; % calculo da capacidade termica
Cvt=N*1.925*(Tt1/Tc).^(3/2);
CvGI=3*N*ones(length(Tt2),1)/2; % Cv do gas ideal classico ERRO
plot(Tv/Tc,Cv/N,marker)
xlabel('T/Tc'); ylabel('Cv/N')

hold on

plot(Tt1/Tc,Cvt/N, 'r-',Tt2/Tc,CvGI/N,'r--','HandleVisibility','off')
legend(legenda,'Location','SouthEast')

end
