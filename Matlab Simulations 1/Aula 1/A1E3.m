close all
clear all 
A = 2; 
x = 0:0.1:24;
for lambda = 2:0.1:6 
    y = A.*cos(2*pi*x/lambda);
    plot(x,y,'-sr','linewidth',3);
    pause(0.03)
end