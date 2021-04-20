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
figure(2)
r=[cos(2*pi/12),-sin(2*pi/12);sin(2*pi/12),cos(2*pi/12)]
for t=1:4
    
    
for i= 1:7
    x=b(1,i);
    y=b(2,i);
    lolitos=r*[x;y];
    b(1,i)=lolitos(1);
    b(2,i)=lolitos(2);
   
end
plot(b(1,1:7), b(2,1:7), 'b',0,0,'r')
pause(1)
end


