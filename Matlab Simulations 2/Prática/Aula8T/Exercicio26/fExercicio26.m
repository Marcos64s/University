
function [Tobs,Ep,press]=fExercicio2Slides2(N,rho,T,nequi,npassos);


L=(N/rho)^(1/3);

Ec0=3*N*T/2;
% estado inicial desordenado
x=L*rand(N,1);y=L*rand(N,1);z=L*rand(N,1);

px=ones(N,1)*sqrt(3*T);
px=(2*floor(2*rand(N,1))-1)*sqrt(3*T);
py=zeros(N,1);pz=zeros(N,1);
%fgrafico(x,y,z,px,py,pz,L)
%variaveis para calculo da media temporal do histigrama das velocidades
vh=linspace(-5,5,50); %valores de velocidade para calculo dos histogranas
hvx=zeros(1,50); hvy=hvx;hvz=hvx;
% histogramas iniciais
[h0vx]=hist(px,vh);[h0vy]=hist(py,vh);[h0vz]=hist(pz,vh);
 
dt=0.01;
%equilibracao do sistema a temperatura pre-determinada

for passo=1:nequi
[x,y,z,px,py,pz,Ec,Ep,press]=fintegracao(1,dt,N,L,x,y,z,px,py,pz);
fp=sqrt(Ec/Ec0); 
%escalonamento das velocidades para equilibrar
% a temperatura desejada.
px=px/fp; py=py/fp;pz=pz/fp;

end


for passo=1:npassos
[x,y,z,px,py,pz,Ec,Ep,press]=fintegracao(1,dt,N,L,x,y,z,px,py,pz);
%fgrafico(x,y,z,px,py,pz,L)
Ect(passo)=Ec;  Ept(passo)=Ep; presst(passo)=press;
%calculo de histogramas
[htvx]=hist(px,vh);[htvy]=hist(py,vh);[htvz]=hist(pz,vh);
hvx=hvx+htvx; hvy=hvy+htvy;hvz=hvz+htvz; 

end
%calculo da media temporal dos histogramas
hvx=hvx/npassos; hvy=hvy/npassos; hvz=hvz/npassos;

figure(1)

plot(1:npassos,Ect,'b-',1:npassos,Ept,'r-',1:npassos,Ect+Ept,'g-')
xlabel('t')
ylabel('Ec(t) e Ep(t)')
figure(2)
plot(1:npassos,presst,'b-')
xlabel('t')
ylabel('Pressao(t)')
Tobs=mean(Ect)*2/(3*N);
press=mean(presst);
Ep=mean(Ept);

dvx=vh(2)-vh(1);
hvTeor=N*exp(-vh.^2/(2*Tobs))*dvx/sqrt(2*pi*Tobs);
figure(3)
plot(vh,h0vx,'r-',vh,h0vy,'b-',vh,h0vz,'g-')
title('t=0, histograma das velocidades')
xlabel('v') 
ylabel('h(v)')
figure(4)
plot(vh,hvx,'r.',vh,hvy,'b.',vh,hvz,'g.',vh,hvTeor,'k-')
title('media temporal dos histogramas  das velocidades')
xlabel('v') 
ylabel('h(v)')
end


