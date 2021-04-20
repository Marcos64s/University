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



