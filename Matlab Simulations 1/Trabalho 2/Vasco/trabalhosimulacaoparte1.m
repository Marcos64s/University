%% Introduçao
x=1:19
lambda=25;
f=exp(-x/lambda);
plot(x,f,'r.')
%passo 2
hold on
xpol=linspace(-5,40,100);
ypol = interp1(x,f,xpol,'linear');
plot(xpol,ypol,'b.')
%passo 3
f_done=exp(-xpol/lambda);
plot(xpol,f_done,'k-')
%passo 4
hold off
ypol_1 = interp1(x,f,xpol,'cubic');
plot(xpol,ypol_1,'r.')
ypol_2 = interp1(x,f,xpol,'spline');
plot(xpol,ypol_2,'b.')

%% Introdução 2
x=1:2:39;
y=exp(x/40);
plot(x,y,'ro')
x_100pontos=linspace(1,39,100)
a=polyfit(x,y,2);
plot(x_100pontos,aa)
hold on
new_x=linspace(-5,100,100)
new_y1=exp(new_x/40);
plot(new_x,new_y1)
hold on
new_y2=polyval(a,new_x)
plot(new_x,new_y2)
