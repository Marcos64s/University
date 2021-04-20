%exercicio revisoes (30)

clear all;
close all;

N=40; nequi=1000;%nequi=10000;

npassos=10000;%

ic=0;%---------------->contador 

%_______________FOR para osciladores CLASSICOS_________________
for E0=linspace(1,2*N+1,4) 
    
 ic=ic+1;%---->incrementacao contador  
 fprintf(1,'Simulacao %d,\n',ic)
%===========FUNCAO==========================
[Emedio,EDmedio]=osciladores_classicos(N,E0,nequi, npassos);

Em(ic)=Emedio; 
T(ic)=EDmedio;

end

figure(1)
plot(T,Em,'+k')  
ylabel('Emedio')
xlabel('T')  % No eixo dos  dos xx e' melhor colocar T 

Tv=linspace(T(1),T(end), 100); % convem ter mais temperaturas
Etclass=N*Tv; %expressao teorica

hold on 
plot(Tv, Etclass,'-b') 

ic=0;

%_______________FOR para osciladores QUANTICOS_________________
for E0=1:20:2*N+1 % 
                                
 ic=ic+1;%---->incrmentacao contador  
 fprintf(1,'Simulacao %d,\n',ic)
%===========FUNCAO==========================   
[Emedio,EDmedio]=osciladores_quanticos(N,E0,nequi, npassos);

Em(ic)=Emedio; 

T(ic)=1/(log(1+(1/EDmedio)));

end 


plot(T, Em,'Xk') 
ylabel('Emedio')
xlabel('T')

Tv=linspace(T(1),T(end), 100); 
Etquant=N*(1/2+1./(exp(1./Tv)-1));

hold on 
plot(Tv,Etquant,'-r') 