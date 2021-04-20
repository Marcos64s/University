clear all;
close all;
clc;
mv=VideoReader('n.mp4');
nframes=int32(mv.Duration*mv.FrameRate);
framerate=get(mv,'FrameRate');
load('pos.mat')
n=5;

for i=1:n:nframes
    for j=1:n
        mov=readFrame(mv);
    end
    if (i>2500 && i<2950)
        image(mov);
        hold on
        title(strcat('Frame',num2str(i),'Ponto',num2str(i)))
        plot(x1(i),y1(i),'o', 'MarkerSize', 25)%Cabeça
        hold on
        plot([x1(i) x2(i)],[y1(i) y2(i)],'-.b','LineWidth', 2)%pescoco
        plot([x2(i) x3(i)],[y2(i) y3(i)],'-g','LineWidth', 2)%braço direito
        plot([x2(i) x4(i)],[y2(i) y4(i)],'-y','LineWidth', 2)%braço esquerda
        plot([x2(i) x5(i)],[y2(i) y5(i)],'-.r','LineWidth', 2)%ponto costas
        plot(x5(i),y5(i),'or','LineWidth', 2, 'MarkerFaceColor', 'red')%ponto costas
        plot([x5(i) x6(i)],[y5(i) y6(i)],'-g','LineWidth', 2)%perna esquerda
        plot([x5(i) x7(i)],[y5(i) y7(i)],'-y','LineWidth', 2)%perna direita
        hold off
        pause(0.1)
    end
    if i>3000
        break
    end
    i
end

close all

i = 1;
while   i<length(x1)
    if(x1(i) == 0 || y1(i) == 0 )
        x1(i) = [];
        y1(i) = [];
        i = i - 1;
    end
    i = i + 1;
end

xs=x1/426;
ys=(360-y1)/10;

dt=1/(framerate);

for i=1:length(xs)
    ta(i)=i*(-dt);
end

a=polyfit(ta,ys,2);

gteorico=-9.8;
gobtido=2*a(1);
q=gteorico/gobtido;

t=q.*ta;

%ALtura
y0=a(3);
v0y=a(2);
ac=a(1);
%Alcance
c=polyfit(t,xs,1);
x0=c(2);
v0x=c(1);
v=sqrt(v0x^2+v0y^2);
figure(2)
plot(t,ys,'ob')
title ('Variação do Centro de Massa')
xlabel('Tempo(s)')
ylabel('Distancia(m)')
figure(3)
plot(t,xs,'ok')
title('Alcance do atleta')
xlabel('Tempo(s)')
ylabel('Distancia(m)')