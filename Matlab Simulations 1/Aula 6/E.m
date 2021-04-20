%x(t) = v*t
%x(t) = A*sin(2*pi/T+fi)+x0


close all;
clear all;
clc;


v = 0.5;
x0 = -1;
A = 1;
wt = 2*pi/5;
raio= 0.12;
c = 0;


for t = [0:0.1:9]
    %condicioes colisão
    x2 =x0-0.35+A.*sin(wt*t);
    if dist(t)<raio+0.35
        c = 1;
    end
    if c == 0
        x1 = -4+v*t;
    else
        x1 =-3*0.35-v*t;
    end
    %movimento
    plot(x1,raio,'o','MarkerSize', 20);
    hold on
    %x2 =x0-0.35+A.*sin(wt*t);
    plot(x2,raio,'o','MarkerSize', 20);
    %fronteiras
    frontx = [-5 0 0; 0 0 5];
    fronty = [0 0 0.5; 0 0.5 0.5];
    plot (frontx, fronty, 'k')
    %mola
    line([x2 ;0],[raio ;raio])
    
    %condicioes colisão
    hold off
    xlim([-5 5])
    ylim([-1 2])
    pause(0.1)
end