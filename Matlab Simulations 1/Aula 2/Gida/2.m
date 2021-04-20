clear all
close all
clc


n=6
x=4
y=4
r=[cos(2*pi/n),-sin(2*pi/n);sin(2*pi/n),cos(2*pi/n)]
v=[x;y]
b=v
r*v
for i=1:6
    v=r*v
    b=[b,v]
end
plot(b(1,1:7), b(2,1:7), 'b',0,0,'r')
hold on

f=[2 2]
for i= 1:5
    for j= 1:7
      d=[2,2,2,2,2,2,2;2,2,2,2,2,2,2]
      b=b+d
    end
    plot(b(1,1:7), b(2,1:7))
end
   

