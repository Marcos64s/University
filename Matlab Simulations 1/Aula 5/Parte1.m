close all;
clear all;
clc;

b=0;
x=0.5;

for r = [0.1:0.1:3.9]
    clf;
    for n = [0:0.1:1]
        y = r*x*(1-x)+b;
        hold on
        plot(x,y,'.b') 
        axis equal
        pause(0.1)
    end
end

