close all;clear all;clc;
%Este Script analisa como uma variavel influencia a evolução do virus

popmundi=10^4;%7773096136;
matrizn=round(sqrt(popmundi));%da tamanho da matriz mundo
mundo=sparse(zeros(matrizn));%criação matriz mundo

%% Criação de Matrizes
tdninfetados=mundo;
dinfec=[mundo zeros(matrizn);zeros(matrizn) zeros(matrizn)];

%% Propriedades
infetado=1;
curado=2;
serinfetado2=4;
morto=3;
barreira=-1;
%% probablidade 
producontc=4;

r=0:0.3:1;
prob=abs(r);

prob=prob(1,:);
tamanho=length(prob);

prob=circular(prob);
tamanho=length(prob);

% prob=flip(toeplitz(prob, [1 zeros(1,tamanho-1)])');
% prob=[prob flip(prob)';flip(prob) flip(flip(prob)')];
% prob(:,tamanho)=[];
% prob(tamanho,:)=[];
% tamanho=length(prob);
prob=(prob/max(max(prob)));
sub=floor((tamanho)/2);

%% Condições de Obstaculo
obs=zeros(matrizn);
% obs=diag(-ones(matrizn,1))+diag(-ones(matrizn-1,1),1)+diag(-ones(matrizn-1,1),-1);
% mundo(end-3:end,end-3:end)=0;

numero_barreira=randi(popmundi,1,3);
for i=1:numero_barreira
   obs(randi(matrizn),randi(matrizn))=barreira;
end
mundo1=mundo+obs;
[x5,y5]=find(mundo1==barreira);
%% Condições do Virus
tmortalidade=0.9;
ti=95/100;
ti2=10^-4;
tmobilidade=1;
anos=100;
dia_max_infetado=14;

%% Variação variaveis
N = numero_barreira;%0:0.2*tmobilidade:tmobilidade; %mudar variavel para avaliar

finalmortostempo=zeros(length(N),anos*365);
finalinfetadostempo=finalmortostempo;
finalcurados=finalmortostempo;

for w=1:length(N)
    tic
tmobilidade=N(w); %mudar variavel para avaliar (não mudar N)(Var_a_avaliar=N(w))

% curados1(1)=0;
% infetadostempo1(1)=0;
% mortostempo1(1)=0;

%inicialização 
mundo=mundo1+obs;
infetadoini=round([rand()*matrizn+1;rand()*matrizn+1]);
mundo(infetadoini(1),infetadoini(2))=1;
dinfec(infetadoini(1),infetadoini(2))=1;
c=0;
dinfec=[mundo zeros(matrizn)];

for dias=1:365*anos
[x,y]=find(mundo==1);
    
    for infe=1:length(x)
        if ~isnan(x(infe))
        value=randi(tamanho,tamanho)/tamanho<=prob(:,:);%verificar se fica infetado ou não
        [i,j]=find(value== 1);%indices dos que ficam infetados
        lim=[x(infe)-round((tamanho-1)/2)-1,y(infe)-round((tamanho-1)/2)-1];
        for k=1:length(i)
            novox=lim(1)+i(k);novoy=lim(2)+j(k);%pontos novos infetados
            if ((novox<matrizn+1)&&(novoy<matrizn+1)&&(novoy>0)&&(novox>0)&&(mundo(novox,novoy)~=curado)&&(mundo(novox,novoy)~=morto)&&(mundo(novox,novoy)~=-1))
                mundo(novox,novoy)=1; %Ficou infetado
            end
        end
        end
    end
        
    for k=1:length(x)
        var=dinfec(x(k),y(k));
        if (var > 14)&&(rand()<0.9)&&(mundo(x(k),y(k))==1)||((rand()<ti2)&&(mundo(x(k),y(k))==4))
            mundo(x(k),y(k)) = 2; %curado
        elseif (var > 17)&&(rand()<tmortalidade)&&((mundo(x(k),y(k))==1)||(mundo(x(k),y(k))==4))
            mundo(x(k),y(k)) = 3; %morto
        end
        dinfec(x(k),y(k))=dinfec(x(k),y(k))+1;
    end
    
    [x,y]=redundant(matrizn,x,y,mundo,infetado);
    
    [x2,y2]=find(mundo==2);
    [x3,y3]=find(mundo==3);
    [x4,y4]=find(mundo==4);
    
    [x2,y2]=redundant(matrizn,x2,y2,mundo,curado);
    [x4,y4]=redundant(matrizn,x4,y4,mundo,serinfetado2);
    
     for k=1:length(x2)
         if ~isnan(x2(k))&&(rand<0.05) %voltar a ser sucetivel ao virus
             mundo(x2(k),y2(k)) = 4;
         end
     end

     if (rand()<tmobilidade)&&(rand()<1/(length(x)))%taxa de viagem
        a=[ceil(rand()*matrizn),ceil(rand()*matrizn)];
        if ((mundo(a(1),a(2))~=morto)&&(mundo(a(1),a(2))~=-1))
                mundo(a(1),a(2))=infetado; %Ficou infetado
        end
     end
    
    if isempty(infe)&&isempty(x)
        break
    end
    
    plot(x,y,'.r',x2,y2,'.b',x4,y4,'.y',x3,y3,'.k',x5,y5,'.m')
    axis([0,matrizn,0,matrizn]);
    title(num2str(N(w)))
    xlabel(num2str(dias))
    pause(0.01)
    
    infetadostempo(dias)=sum(sum(mundo==1));
    curados(dias)=sum(sum(mundo==2));
    mortostempo(dias)=sum(sum(mundo==3));
end
tempomed(w)=dias;
a=size(finalinfetadostempo);
falta=a(2)-dias;
infetadostempo=[infetadostempo zeros(1,falta+1)];
curados=[curados zeros(1,falta+1)];
mortostempo=[mortostempo zeros(1,falta+1)];
finalinfetadostempo(w,:)=infetadostempo;
finalcurados(w,:)=curados;
finalmortostempo(w,:)=mortostempo;

infetadostempo=0;
curados=0;
mortostempo=0;
toc
end

tempomed1=365%sum(tempomed)/w+30;
finalinfetadostempo=finalinfetadostempo(:,1:tempomed1);
finalcurados=finalcurados(:,1:tempomed1);
finalmortostempo=finalmortostempo(:,1:tempomed1);


for w=1:length(N)
    hold on
    subplot(3,length(N),w)
    plot(1:length(finalmortostempo),finalmortostempo(w,:),'k')
    xlabel(num2str(N(w)))
    ylabel('finalmortostempo')
    axis square
    subplot(3,length(N),w+length(N))
    plot(1:length(finalinfetadostempo),finalinfetadostempo(w,:),'r')
    xlabel(num2str(N(w)))
    axis square
    ylabel('finalinfetadostempo')
    subplot(3,length(N),w+2*length(N))
    plot(1:length(finalcurados),finalcurados(w,:),'b')
    xlabel(num2str(N(w)))
    axis square
    ylabel('finalcurados')
end
