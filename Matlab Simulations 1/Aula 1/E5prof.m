close all
clear all

r = [5 5];
r0 = [0 0];
v = [0.1 0.1];
t = 0;

while r(1)>=0
    r = r0+v*t;
    plot([0 5],[0 5],':k')
    hold on
    plot(r(1),r(2),'.r','MarkerSize',30)
    hold off
    if r(1)>=5
        v =-v;
        t = 0;
        r0 = r;
    end
    t = t+1;
    pause(0.1)
end