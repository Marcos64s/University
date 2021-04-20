acrob=VideoReader('vid2.avi');
 nframes=round(acrob.Duration*acrob.FrameRate);
salto=5;
load('matlab.mat')
for i=1:5:nframes
for j=1:5
 mov=readFrame(acrob);
end
F(i)=getframe
image(mov)
hold on
plot(x1(i),y1(i),'b.')
plot(x2(i),y2(i),'r.')
plot(x3(i),y3(i),'k.')
hold off
end

%% passo 4 - nova origem
%utilizando a origem como o ponto (x3,y3) que é fixo

x4=x3(1:5:end)-x1(1:5:end);
y4=y3(1:5:end)-y1(1:5:end);
%utilizam-se os pontos de 17 a 25 uma vez que estes são relativos ao
%movimento do salto;
p=polyfit(x4(17:24)*0.0225,y4(17:24)*0.0225,2);
f=polyval(p,x4(17:24)*0.0225);
plot(x4(17:24)*0.0225,f,'o')
%% passo 5
t=0:(1/acrob.FrameRate):(nframes*1/acrob.FrameRate)-(1/acrob.FrameRate);
%assumindo que o ginasta tem 1,80 m e e isso correponde  cerca de 80 pixeis,
%cada pixel tem 1.80/80=0.0225 m
novo_y=0.0225*y4(17:24);
tempo_5_em_5_frames=t(1:5:end);
t_curva=tempo_5_em_5_frames(17:24);
coeficiente=polyfit(t_curva,novo_y,2);
%-1/2(aceleracao)=coeficiente(1)
%aceleração=-2*coeficiente(1)
aceleracao=-2*coeficiente(1);
%podemos considerar que o vídeo não foi


%% Passo 6
%parte 1
novo_xcm=0.0225*x4(17:24);
%para o ponto no centro de massa utilizando, o ponto 3 como origem, tem-se
%novo_x, o novo_y e o t_curva(como pontos definidos)
full_tempo_curva=t(17*5:24*5);
%o full_tempo_de_curva corresponde ao intervalo de tempo do salto mas com
%todos os frames
X_CM = interp1(t_curva,novo_xcm,full_tempo_curva,'spline');
%Em X temos estimadas as posicoes no eixo do x
Y_CM = interp1(t_curva,novo_y,full_tempo_curva,'spline',);
plot(X_CM,Y_CM,'.')

%%
%parte 2
%agora para os pontos da cabeça tendo o ponto 3 como origem
x5=x3(1:5:end)-x2(1:5:end);
y5=y3(1:5:end)-y2(1:5:end);
novo_xcabeca=0.0225*x5(17:24);
novo_ycabeca=0.0225*y5(17:24);
X_CABECA = interp1(t_curva,novo_xcabeca,full_tempo_curva,'spline');
%Em X temos estimadas as posicoes no eixo do x
Y_CABECA = interp1(t_curva,novo_ycabeca,full_tempo_curva,'spline');
plot(X_CABECA,Y_CABECA,'.')

%%
%parte 3
%agora para os pontos da cabeça tendo o CM como origem
x6=-x1(1:5:end)+x2(1:5:end);
y6=-y1(1:5:end)+y2(1:5:end);
novo_x_cabeca_CM=0.0225*x6(17:24);
novo_y_cabeca_CM=0.0225*y6(17:24);
X_CABECA_CM= interp1(t_curva,novo_x_cabeca_CM,full_tempo_curva,'spline');
%Em X temos estimadas as posicoes no eixo do x
Y_CABECA_CM = interp1(t_curva,novo_y_cabeca_CM,full_tempo_curva,'spline');
plot(X_CABECA_CM,Y_CABECA_CM,'-')
%% passo 7
teta=[];
for l=1:numel(novo_x_cabeca_CM)
    Prod_interno=X_CABECA_CM(l)*X_CABECA_CM(l+1)+Y_CABECA_CM(l)*Y_CABECA_CM(l+1);
    Modulo_1=sqrt(X_CABECA_CM(l).^2+Y_CABECA_CM(l).^2);
    Modulo_2=sqrt(X_CABECA_CM(l+1).^2+Y_CABECA_CM(l+1).^2);
    teta(l)=acos(Prod_interno/(Modulo_1*Modulo_2));
end
%tt é o tempo entre a variaçao de angulos
tt=1/acrob.FrameRate;
veloc_ang=teta/(tt);
full_veloc_ang=interp1(t_curva,veloc_ang,full_tempo_curva,'spline');
% a altura em que a velocidade angular é máxima é
k=find(full_veloc_ang==max(full_veloc_ang));
h=Y_CABECA(k);
