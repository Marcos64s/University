function [x,y,z,px,py,pz,Ec,Ep,press]=fintegracao(npassos,dt,N,L,x,y,z,px,py,pz)
for t=1:npassos
% calculo das forças
 [Fx,Fy,Fz,Ep,vir]=fForcas(L,N,x,y,z);
 x=x+dt*px+0.5*dt^2*Fx; 
 y=y+dt*py+0.5*dt^2*Fy;
 z=z+dt*pz+0.5*dt^2*Fz;
 
 x=x-L*floor(x/L); y=y-L*floor(y/L);z=z-L*floor(z/L); %Cond Front Periodicas
 [Flx,Fly,Flz,Ep,vir]=fForcas(L,N,x,y,z);
 px=px+0.5*dt*(Fx+Flx);
 py=py+0.5*dt*(Fy+Fly);
 pz=pz+0.5*dt*(Fz+Flz);
 Ec=sum(px.^2+py.^2+pz.^2)/2;
 press=2*Ec/(3*L^3)+vir/(3*L^3);
 
end
end