clear all
close all
clc

load pos.mat

direction = [1 1 0];

for i = 1:size(x1')
    if (i>2795 && i<2950 && x1(i) ~= 0 )
        plot(x1(i),y1(i),'o', 'MarkerSize', 50)%Cabeça
        hold on
        plot([x1(i) x2(i)],[y1(i) y2(i)],'-.b','LineWidth', 2)%pescoco
        plot([x2(i) x3(i)],[y2(i) y3(i)],'-g','LineWidth', 2)%braço direito
        plot([x2(i) x4(i)],[y2(i) y4(i)],'-y','LineWidth', 2)%braço esquerda
        plot([x2(i) x5(i)],[y2(i) y5(i)],'-.r','LineWidth', 2)%ponto costas
        plot([x5(i) x6(i)],[y5(i) y6(i)],'-g','LineWidth', 2)%perna esquerda
        plot([x5(i) x7(i)],[y5(i) y7(i)],'-y','LineWidth', 2)%perna direita
        hold off
        set(gca,'Ydir','reverse')
        
        xlim([0 200])
        ylim([0 100])
        pause(0.1)
    end
end