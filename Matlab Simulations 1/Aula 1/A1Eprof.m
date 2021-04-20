close all
clear all 
A = 5;
T = 20;
x = -5:0.1:5;
for lambda = 2:0.1:6 
    y = x.^2;
    for t = 0 : 0.1 : 100
        xb = A*sin((2*pi*t/T) + pi/2);
        yb = xb^2;
        xlim = [-6,6];
        ylim = [0,A^2];
        plot(x,y,'.k');
        hold on 
        plot(xb,yb,'or','MarkerSize',2);
        hold off
        vel = A*(2*pi/T)*cos((2*pi*t/T) + pi/2);
        ac = -A*((2*pi/T)*(2*pi/T))*sin((2*pi*t/T) + pi/2);
        hold on
        quiver(xb,yb,vel,ac, 'b');
        hold off
        pause(0.1)
    end
    pause(0.03)
end