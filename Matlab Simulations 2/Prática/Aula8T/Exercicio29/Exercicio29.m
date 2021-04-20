clear all
close all
%esta versao nao calcula a pressao
% calcula apenas a energia potencial media

n=4;
N=n^3; %tem que ser um cubo perfeito para posicao inicial em ree cubica
T=1.5; %valor de temperatura pretendida
fprintf(1,'N=%d\n',N)
ED=T;
rho=0.1; % densidade
fprintf(1,'Densidade=%f\n',rho)

L=(N/rho)^(1/3);
fprintf(1,'L=%f\n',L)

%r=L*rand(N,3); % posiçao inicial aleatoria dentro da caixa
%posiçao inicial numa rede cubica
L1=(1/rho)^(1/3);
i=0;
for x=linspace(0,L-L1,n)
    for y=linspace(0,L-L1,n)
        for z=linspace(0,L-L1,n)
            i=i+1;
            r(i,1)=x;r(i,2)=y;r(i,3)=z;
                    end
    end
end


dr0=0.1*(1/rho)^(1/3);
nequi=10000;
npassos=10000;
T=1.5; %valor de temperatura pretendida

% calculo da energia inicial de cada particula
Ep=zeros(N,1);
for i=1:N
     [Ep(i)]=EPLJ_part_i(L,N,r,i);
end
Eptotal=sum(Ep)/2;
EDmedio=0;
pacmedia=0; % probabilidade media de aceitar
%equilibraçao do sistema a uma dada temperatura
for t=1:nequi
    %escolher uma particula ao acaso
    % i entre 1 e N com distribuiçao uniforme
    for k=1:N % para que cada particula seja perturbada 1 vez em media por passo
    i=floor(N*rand(1))+1;
    dr=dr0/2 * (2*rand(1,3)-1);
    rni=r(i,:)+dr;
    rni=rni-L*floor(rni/L); % condiçoes fronteira periodicas

    [Epnova,dE]=EPLJ_Nova(L,N,r,rni,i,Ep);
    
    if (ED-dE >=0)
        r(i,:)=rni;
        ED=ED-dE;
        Eptotal=Eptotal+dE;
        Ep=Epnova;
        pacmedia=pacmedia+1;
    end
    end
    EDmedio=EDmedio+ED;
    Tobs=EDmedio/t;
    fac=T/Tobs;
    if(pacmedia/(N*t) > 0.5)
        dr0=min([dr0*1.01,L1]);
    else
        dr0=dr0*0.99;
    end
    ED=ED*fac; % damos ou retiramos energia ao demon para se atingir a temperatura pretendida.
    
end
% calculo das propriedades do sistema

fprintf(1,'Energia total Inicial=%f\n',Eptotal+ED)
fprintf(1,'Energia Potencial Inicial=%f\n',Eptotal)
fprintf(1,'dr0=%f\n',dr0)
fprintf(1,'pacmedia=%f\n',pacmedia/(N*t))

EDt=zeros(npassos,1);
for t=1:npassos
    %fprintf(1,'t=%f\n',t)
    %escolher uma particula ao acaso
    % i entre 1 e N com distribuiçao uniforme
    for k=1:N % para que cada particula seja perturbada 1 vez em media por passo
    i=floor(N*rand(1))+1;
    dr=dr0/2 * (2*rand(1,3)-1);
    rni=r(i,:)+dr;
    rni=rni-L*floor(rni/L); % condiçoes fronteira periodicas
    [Epnova,dE]=EPLJ_Nova(L,N,r,rni,i,Ep);
    
    if (ED-dE >=0)
        r(i,:)=rni;
        ED=ED-dE;
        Ep=Epnova;
        Eptotal=Eptotal+dE;
    end
    end

    EDt(t)=ED;
    EPt(t)=Eptotal;
    
end


EDmedio=sum(EDt)/npassos;
EPmedio=sum(EPt)/npassos;
figure(1)
plot(1:npassos,EPt/N,'k-')
xlabel('t')
ylabel('Ep(t)/N')
fprintf(1,'Temperatura fixada inicialmente=%f\n',T)
fprintf(1,'Temperatura obtida de <ED>=%f\n',EDmedio)
fprintf(1,'Energia Potencial media por particula=%f\n',EPmedio/N)


figure(2)
subplot(2,1,1)
plot(1:npassos,EDt,'k-')
xlabel('t');ylabel('ED(t)')
subplot(2,1,2)
edh=linspace(0,8*T,50);
hEd=hist(EDt,edh);
dEd=edh(2)-edh(1);
hEdteor=T^(-1)*exp(-edh/T)*dEd*npassos;
semilogy(edh,hEd,'.',edh,hEdteor,'k-')
xlabel('ED')
ylabel('Histograma da energia do Demon')




