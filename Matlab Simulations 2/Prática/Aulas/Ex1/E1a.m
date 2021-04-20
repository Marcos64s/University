close all;clear all;clc;
janelasx=2;
janelasy=1;
%% a
n=10^6;
nbins=100;
u=rand(n,1);
theta=acos(1-2*u);
[h,x]=hist(theta,nbins);
subplot(janelasy,janelasx,1)
hold on
hist(theta,nbins);
plot(x,h,'r*')
xlabel('Theta');
ylabel('Nº de Pontos')
hold off
subplot(janelasy,janelasx,2)
xmax=max(x);xmin=min(x);
dx=(xmax-xmin)/nbins;
hn=h/(n*dx);
plot(x,hn,'*',x,sin(x)/2)
xlabel('Theta')
ylabel('Probabilidade(Theta)')

%% b
figure(2)
n=10^2;
u=rand(n,1);
theta=acos(1-2*u);
phi=rand(n,1)*2*pi;
vx=sin(theta).*cos(phi);
vy=sin(theta).*sin(phi);
vz=cos(theta);
subplot(janelasy,janelasx,1)
plot3(vx,vy,vz,'b.')
subplot(janelasy,janelasx,2)
mzeros=zeros(n,3);
quiver3(mzeros(:,1),mzeros(:,2),mzeros(:,3),vx,vy,vz,0)