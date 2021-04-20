function [ Fluxo, erroF, Pressao, erroP ] = fexercicio31( N,L,T,Nestados )

dr=0.01; dA=pi*dr^2; %dados da abertura
dt=0.01; % intervalo de tempo
r=zeros(N,3); %posicoes das particulas a 3 dimensoes
v=zeros(N,3); % velocidades a 3 dimensoes
Fluxo=0; erroF=0;
Pressao=0; erroP=0;
A=L^2; V=L^3; % u_L arbitrario.
% gerar Nestados
for n=1:Nestados
   % gerar posicoes % Gas Ideal
    r(:,1:2)= L*(rand(N,2)-0.5); % coordenadas x e y entre -0.5 e 0.5
    r(:,3)=L*(rand(N,1)-1); % coordenadas z entre -1 e 0
    % gerar velocidades
    v=randn(N,3)*sqrt(T); % geramos v com a distribuicao de velocidades de Maxwell com 
    % variancia proporicional a temperatura T
    
    %%%%%%%%%%%%
    % CALCULO MAIS RIGOROSO QUE O USADO NA AULA P8
    %
    % no intervalo de tempo dt as particulas movem-se
    dt0=(0-r(:,3))./v(:,3); % dt0=tempo até chegar a z=0 (parede)
    dt0(dt0<0)=dt; % tempos negativos correspondem a particulas que se afastam da parede
    %se substituirmos d0<0 por dt>0 ainda estarão mais afastadas da parede
    %e nao sao contadas.
     
    dt0=min([repmat(dt,N,1),dt0],[],2); %particulas que atingem a parede mais tarde que dt 
    %nao devem ser contadas. Para as que atingem a parede ficamos a  saber
    % a sua posição no instante em que cruzam a parede.
    %As suas coordenadas x e y devem estar dentro do elemento de area, dA
    %que se encontra na origem do sistema de eixos
    rn=r+v.*repmat(dt0,1,3);
    % FIM DE CALCULO ALTERNATIVO MAIS RIGOROSO
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%
    % CALCULO FEITO NA AULA
    % rn=r+v*dt;
    %%%%%%%%%%%%%%%
   
    % determinamos agora quais sao as particulas que saem da caixa pela
    % abertura
    condicao_saida=(rn(:,3)>=0) & (sqrt(rn(:,1).^2+rn(:,2).^2) <= dr);
    condicao=rn(:,3)>=0 ; % numero de particulas que embatem na parede z=0
   % as particulas com x ou y>L/2 e x ou y<L/2 batem nas paredes y=+/-L/2
   % x=+/-L/2 mas acabam por bater na parede z=0;
    numero= sum(condicao_saida);
    
    %alinea a
    Fluxo=Fluxo+numero/(dA*dt);
    erroF=erroF+(numero/(dA*dt))^2;
    % alinea b
    Forca=-sum(-2*v(condicao,3)/dt);  % Forca exercida na parede
    Pressao=Pressao+Forca/A;
    erroP=erroP+(Forca/A)^2;
    
end
    Fluxo=Fluxo/Nestados; % media do Fluxo
    erroF=erroF/Nestados; % media do Fluxo ao quadrado
    erroF=sqrt((erroF-Fluxo^2)/Nestados);
    Pressao=Pressao/Nestados;
    erroP=erroP/Nestados;
    erroP=sqrt((erroP-Pressao^2)/Nestados);
   
end



