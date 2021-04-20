close all;clear all;clc;

popmundi=10^5;%7773096136;
matrizn=round(sqrt(popmundi));%da tamanho da matriz mundo
mundo=zeros(matrizn);%criação matriz mundo

%% Criação de Matrizes
tdninfetados=mundo;
dinfec=[mundo zeros(matrizn);zeros(matrizn) zeros(matrizn)];

%inicialização 
%infetadoini=round([rand()*matrizn+1;rand()*matrizn+1]);
infetadoini=round([matrizn/2;matrizn/2]);
mundo(infetadoini(1),infetadoini(2))=1;
dinfec(infetadoini(1),infetadoini(2))=1;

%Propriedades
infetado=1;
curado=2;
serinfetado2=4;
morto=3;
barreira=-1;

%% matriz probablidade de infecção

%dIdt=p*I(t)*(popmundi-I)/popmundi;
x=0:0.1:1;
r=x.^2;
prob=abs(r);

prob=prob(1,:);
prob=circular(prob);
tamanho=length(prob);

% prob=flip(toeplitz(prob, [1 zeros(1,tamanho-1)])');
% prob=[prob flip(prob)';flip(prob) flip(flip(prob)')];
% prob(:,tamanho)=[];
% prob(tamanho,:)=[];
% tamanho=length(prob);
prob=(prob/max(max(prob)));

%% Condições de Obstaculo
obs=zeros(matrizn);
% obs=diag(-ones(matrizn,1))+diag(-ones(matrizn-1,1),1)+diag(-ones(matrizn-1,1),-1);
% mundo(end-3:end,end-3:end)=0;

%Nem todos os humanos são suscetiveis ao virus

for i=1:500
   obs(randi(matrizn),randi(matrizn))=barreira;
end
mundo=mundo+obs;
[x5,y5]=find(mundo==barreira);
%% Condições do Virus
tmortalidade=10;
ti=95/100;
ti2=1-ti;
tmobilidade=0.005;

%% Modelação do mundo
anos=10;
% curados1(1)=0;
 infetadostempo(1)=0;
% mortostempo1(1)=0;
 tic
for dias=1:365*anos
    [x,y]=find(mundo==infetado); 
    for infe=1:length(x)
        if ~isnan(x(infe))
        value=randi(tamanho,tamanho)/tamanho<=prob(:,:);%verificar se fica infetado ou não
        [i,j]=find(value== 1);%indices dos que ficam infetados
        lim=[x(infe)-round((tamanho-1)/2)-1,y(infe)-round((tamanho-1)/2)-1];
        for k=1:length(i)
            novox=lim(1)+i(k);novoy=lim(2)+j(k);%pontos novos infetados
            if ((novox<matrizn)&&(novoy<matrizn)&&(novoy>0)&&(novox>0)&&(mundo(novox,novoy)~=curado)&&(mundo(novox,novoy)~=morto)&&(mundo(novox,novoy)~=barreira))
                mundo(novox,novoy)=1; %Ficou infetado
            end
        end
        end
    end
        
    for k=1:length(x)
        var=dinfec(x(k),y(k));
        if ((var > 14)&&(rand()<ti)&&(mundo(x(k),y(k))==infetado))||((rand()<ti2)&&(mundo(x(k),y(k))==serinfetado2))
            mundo(x(k),y(k)) = curado; %curado            
        end
        if (var > 17)&&(rand()<tmortalidade)&&((mundo(x(k),y(k))==infetado)||(mundo(x(k),y(k))==serinfetado2))
            mundo(x(k),y(k)) = morto; %morto
        end
        dinfec(x(k),y(k))=dinfec(x(k),y(k))+1;
    end
    
    
    [x,y]=redundant(matrizn,x,y,mundo,infetado);
    
    
    [x2,y2]=find(mundo==curado);
    [x3,y3]=find(mundo==morto);
    [x4,y4]=find(mundo==serinfetado2);
    
    [x2,y2]=redundant(matrizn,x2,y2,mundo,curado);
    [x4,y4]=redundant(matrizn,x4,y4,mundo,serinfetado2);
    
     for k=1:length(x2)
         if ~isnan(x2(k))&&(rand<0.01) %voltar a ser sucetivel ao virus
             mundo(x2(k),y2(k)) = serinfetado2;
         end
     end
    if (rand()<tmobilidade)&&(rand()<1/(length(x)))
     a=[ceil(rand()*matrizn),ceil(rand()*matrizn)];
        if ((mundo(a(1),a(2))~=morto)&&(mundo(a(1),a(2))~=-1))
                mundo(a(1),a(2))=infetado; %Ficou infetado
        end
     end
    infetadostempo(dias)=sum(sum(mundo==infetado));
    curados(dias)=sum(sum(mundo==curado));
    mortostempo(dias)=sum(sum(mundo==morto));
    
    subplot(2,2,[1 2])
    plot(x,y,'.r',x2,y2,'.b',x4,y4,'.y',x3,y3,'.k',x5,y5,'.m')
    axis([0,matrizn,0,matrizn]);
    xlabel(num2str(dias))
    subplot(2,2,3)
    totalsub=popmundi*ones(1,dias)-infetadostempo-curados-mortostempo;
    plot(1:dias,infetadostempo,'g',1:dias,curados,'r',1:dias,totalsub,'b',1:dias,mortostempo,'k')
    legend('% Infetados ao longo do Tempo','%Curados ao longo do tempo','%Subjetiveis ao Longo do tempo','%Mortos ao Longo do tempo')
    subplot(2,2,4)
    plot(1:dias,mortostempo,'b')
    pause(0.001)
    if (isempty(infe)&&isempty(x2)) || ((infetadostempo(end)<0.001*popmundi) && (dias>10))
        break
    end
end
toc
figure(2)
totalsub=(popmundi-infetadostempo-curados-mortostempo)./popmundi;
infetadostempo=infetadostempo./popmundi;
mortostempo=mortostempo./popmundi;
curados=curados./popmundi;
subplot(2,2,1)
plot(1:length(infetadostempo),infetadostempo,'-b')
legend('% Infetados ao longo do Tempo')
subplot(2,2,2)
plot(1:length(infetadostempo),infetadostempo,'-r',1:length(mortostempo),mortostempo,'-k',1:length(curados),curados,'-b',1:length(totalsub),totalsub,'-y')
legend('% Infetados ao longo do Tempo','%Mortos ao Longo do tempo','%Curados ao longo do tempo')
subplot(2,2,[3 4])
contourf(mundo')
colorbar


% figure(3)
% totalsub=popmundi*ones(1,length(infetadostempo1))-infetadostempo1-curados1-mortostempo1;
% plot(1:length(infetadostempo1),infetadostempo1,'-g',1:length(curados1),curados1,'-r',1:length(totalsub),totalsub,'-b')