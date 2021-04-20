function fgrafico(x,y,z,px,py,pz,L)
plot3(x,y,z,'o') %, [0 L],[0,0],'k-',[L,L],[0,L],'k-',[L,0],[L,L],'k-',[0,0],[L,0],'k-')
hold on
quiver3(x,y,z,px,py,pz,0.2,'r')
axis equal
axis([-0.5,L+0.5,-0.5,L+0.5, -0.5,L+0.5])
hold off
drawnow
pause(0.1)
end