close all
clear all

x = 0.1:0.1:5;
v = 0.1;

while x > 0
    y=1;
    for t = 5/v:-0.1:0
        xb = v*t;
        plot(x,y,'.k');
        hold on
        plot(xb,y,'or','MarkerSize',5);
        hold off
        pause(0.1)
    end
    
    for t = 0:0.1:5/v
        xb = v*t;
        plot(x,y,'.k');
        hold on
        plot(xb,y,'or','MarkerSize',5);
        hold off
        pause(0.1)
    end
end




