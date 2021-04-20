close all
clear all
clc

%%%%%%Passo 1%%%%%%%%
x = 0:20;
h = 25;
y = cos(x/h);
hold on
plot(x,y,'or')


%%%%Passo 2%%%%%%%%%
hold on
xpol = -10:0.5:40;
ypol = interp1(x,y,xpol,'cubic');
plot(xpol,ypol,'.-b')
ypol2 = interp1(x,y,xpol,'spline');
plot(xpol,ypol2,'.g')

%%%%%%%%%%Passo 3%%%%%%%%
xpol = -10:0.5:40;
y2 = cos(xpol/h);
plot(xpol,y2,'-k')
%%%%%%%Legenda%%%%%%%%%%
legend('y = cos(x/h)','cubic','spline','y(xpol)')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%I 2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
hold on
a = polyfit(x,y,2);
y3 = a(1)*x.^2+a(2)*x+a(3);
plot(x,y3,'-r')
plot(x,y,'-k')