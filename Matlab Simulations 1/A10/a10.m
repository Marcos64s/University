close all
clear all
clc

dt = 0.1;
l=1;
k = 1 ;
vc(1) = 0;
xc(1) = 1;
xe(1) = l+l/2;
xd(1) = xe(1)+l;
ve(1) = 0;
vd(1) = 0;
vc(1) = 0;
m = 1;
ro=5;


for i = 1:100
    ve(i+1)= ve(i) +(dt/m)*(-k*(xe(i)-xc(i)-l)+k*(xd(i)-xe(i)-l));
    vd(i+1)= vd(i) +(dt/m)*(-k*(xd(i)-xe(i)-l)+k*(xc(i)-xd(i)+2*l));
    vc(i+1)= vc(i)+(dt/m)*(k*(xe(i)-xc(i)-l)-k*(xc(i)-xd(i)+2*l)-ro*vc(i));
    
    
    xe(i+1) = xe(i)+dt*ve(i+1);
    xd(i+1) = xd(i)+dt*vd(i+1);
    xc(i+1) = xc(i)+dt*vc(i+1);
    
    
    plot(xe(i),0, 'or');
    hold on
    plot(xd(i),0, 'ob')
    plot(xc(i),0, 'ok')
    line([xc(i) xe(i) xd(i)],[0 0 0])
    line([xc(i) xc(i) xd(i) xd(i)],[2 -1 -1 2])
    hold off
    xlim([-5 5])
    pause(0.1)
end

    plot([1:100],1/2*m*(ve(i)+vc(i)+vd(i)).^2,'.')
    title('Energia mecanica')