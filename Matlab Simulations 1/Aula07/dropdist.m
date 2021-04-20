function d = dropdist(t)
x0 = -1;
p0 = [x0 10];
a = 4;
g = 10;
v = 3;

x = x0+v*t;

f1 = 20 + v*t - (1/2)*(g*t^2);
f2 = -a*x^2+x^4+6;

d=f2-f1;
end