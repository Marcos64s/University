clear all
close all
n=1e6;
nbins=100;
u=rand(n,1);
th=acos(1-2*u);
[h,x]=hist(th,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(n*dx);
px=sin(x)/2;
plot(x,hn,'x',x,px,'r-')
xlabel('theta'); ylabel('p(theta)');

%b
n=1e2;
u=rand(n,1);
th=acos(1-2*u);
phi=2*pi*rand(n,1);

vx=sin(th).*cos(phi);
vy=sin(th).*sin(phi);
vz=cos(th);
figure(2)
mzeros=zeros(n,3);
quiver3(mzeros(:,1),mzeros(:,2),mzeros(:,3),vx,vy,vz,0);
%plot3(vx,vy,vz,'r.')
