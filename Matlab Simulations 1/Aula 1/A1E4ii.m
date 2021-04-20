close all
clear all

A = 2;
x = 0:0.1:24;

while 1
    for lambda = 2:0.1:6
        y = A.*cos(2*pi*x/lambda);
        plot(x,y,'linewidth',3);
        pause(0.1)
    end
    for lambda = 6:-0.1:2
        y = A.*cos(2*pi*x/lambda');
        plot(x,y,'linewidth',3);
        pause(0.1)
    end
end