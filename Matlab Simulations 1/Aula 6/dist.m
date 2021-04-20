function d = dist(t)
v = 0.5;
x0 = -1;
A = 1;
wt = 2*pi/5;


x1 =-4+ v*t;
x2 =x0-0.35+A.*sin(wt*t);

d=abs(abs(x2)-abs(x1));
end