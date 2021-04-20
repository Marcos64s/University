clear all;
close all;
clc;

l= 2;  % Cumprimento do pendulo
g=9.8; % Gravidade
m=1; % Massa
n=300;  % Numero maximo de frames
dt=0.1;  % Tempo
w(1:n)=0;  % Velociadade Angular array
ang(1:n)=0;  % Coordenada Angular array
t(1:n)=0;   % Tempo array
ang(1)=0.5; % Posicao inicial


for i=1:n-1
    w(i+1)=w(i)-(g/l)*ang(i)*dt;
    ang(i+1)=ang(i)+w(i+1)*dt;
    x(i)=l*sin(ang(i)); % Conversão para cartesianos
    y(i)=-l*cos(ang(i));
    t(i+1)=t(i)+dt;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%Calculo das Energias%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x(n)=l*sin(ang(n));
y(n)=-l*cos(ang(n));
t(n)=2*pi*sqrt(l/g)*(1+(1/4)*(sin(ang(n)/2)).^2);
EC=0.5*m*(l^2)*(w.^2); % Energia cinética
EP=(m*g*y)+g; % Energia potencial
ET=EC+EP; % total de energia


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%Plots%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:n
    subplot(2,2,1)
    plot(x(i),y(i),'.b', 'MarkerSize', 50)
    line([0 x(i)],[0 y(i)])
    xlabel('X ');
    ylabel('Y');
    titlestring = ['Movimento do Pendulo t =',num2str(i*dt), 'segundos'];
    title(titlestring);
    axis([-1.5 1.5  -2.5 0]);

    subplot(2,2,2)
    plot(t(i),EC(i),'.','markersize',15,'MarkerEdgeColor','b')
    hold on
    plot(t(i),EP(i),'.','markersize',15,'MarkerEdgeColor','r')
    hold on
    plot(t(i),ET(i),'.','markersize',15,'MarkerEdgeColor','k')
    title('Energia vs Tempo');
    xlabel('Tempo');
    ylabel('Energia');
    pause(0.0000001)
end

% for i = 1:5:90
%     i(1) = i;
%     w(1) = 0;
%     w(2) = 0;
%     t(1) = 0;
%     while ~(w(i+1)<0 && w(i)>0)
%         w(i+1)=w(i)-(g/l)*ang(i)*dt;
%         ang(i+1)=ang(i)+w(i+1)*dt;
%         t(i+1) = t(i) +dt;
%         i = i+1
%     end
%     hold on
%     plot(i,t(end),'.') 
%     pause(0.1)
%     clear t
% end