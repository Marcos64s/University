
%Valpha = ((Vx cosalpha - Vy Sinalpha)X+ (Vx sinalpha + Vy cosalpha)Y)= 
%= [Vx cosalpha, - Vy Sinalpha; Vx sinalpha + Vy cosalpha]=
%= [cosalpha, -sinalpha; sinalpha, cosalpha]*[Vx;Vy]


%a)
figure(1)
v = [1;0]
n = 5
alpha = (2*pi)/n
M = [cos(alpha) -sin(alpha);sin(alpha) cos(alpha)]
P = zeros(n,2)
for i=1 : (n+1);
    v = M*v
    P(i,:) = v
end
plot(P(:,1), P(:,2),'-k')

%b)
figure(2)
v = [1;0]
M = [1 0;0 1]
n = -1
for i=1 : (n + 1); 
    v = M*v
    P(i,:) = v
end
plot(P(:,1), P(:,2),'-k')
    