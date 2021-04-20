clear all
close all
L=12; N=12;
% posicao inicial das particulas
x=(L/2)*ones(N,1);
a=L/N;  y=linspace(a/2,L-a/2,N); y=transpose(y);
[Fx,Fy]=fForcas(L,N,x,y);


px=ones(N,1); py=zeros(N,1);
%%%%%%%%%%%
%fgraf(x,y,L,px,py);
npassos=500; dt=0.01;
%fprintf(1,'500 passos\n')
% % [x,y,px,py,Ec,Ep]=leapfrog(L,N,npassos, dt, x, y, px, py);
% % px=-px; py=-py;
% % fprintf(1,'Inversao velocidades + 500 passos\n')
% [x,y,px,py,Ec,Ep]=leapfrog(L,N,npassos, dt, x, y, px, py);
fprintf(1,'Adicionámos perturbação velocidade da particula 1 e fazemos 500 passos\n')
px(1)=px(1)+1e-6*(2*rand(1)-1);
py(1)=py(1)+1e-6*(2*rand(1)-1);
npassos=500;
[x,y,px,py,Ec,Ep]=leapfrog(L,N,npassos, dt, x, y, px, py);
figure(2)
t=(1:npassos)*dt;
plot(t,Ec,'bo',t,Ep,'gx', t,Ec+Ep,'r+')
xlabel('t'); ylabel('Energia')

% fprintf(1,'Inversao velocidades e mais 500 passos\n')
% px=-px; py=-py;
% npassos=1000;
% fprintf(1,'Fazemos 1000 passos\n')
% [x,y,px,py,Ec,Ep]=leapfrog(L,N,npassos, dt, x, y, px, py);