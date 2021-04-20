function [Fx,Fy,Fz,Ep,vir]=fForcas(L,N,x,y,z)
Fx=zeros(N,1);Fy=zeros(N,1);Fz=zeros(N,1);
Ep=0;  rmin=0.8;
 Fijmax=48*(rmin^(-13)-0.5*rmin^(-7));
 vmax=4*(rmin^(-12)-rmin^(-6));
%  Fijmax
%  vmax
% pause
vir=0;
for i=1:N-1
    for j=i+1:N
        xij=x(i)-x(j); yij=y(i)-y(j);zij=z(i)-z(j);
        
         xij=xij-L*round(xij/L);
         yij=yij-L*round(yij/L);
         zij=zij-L*round(zij/L);
        
        r=sqrt(xij^2+ yij^2+zij^2);
        if (r<rmin)
            Ep=Ep+vmax;
            Fij=Fijmax;
        else
        Ep=Ep+4*(r^(-12)-r^(-6)); 
        Fij=48*(r^(-13)-0.5*r^(-7));
        end
        
       
        vir=vir+r*Fij; 
        Fx(i)=Fx(i)+Fij*xij/r; Fx(j)=Fx(j)-Fij*xij/r;
        Fy(i)=Fy(i)+Fij*yij/r; Fy(j)=Fy(j)-Fij*yij/r;
        Fz(i)=Fz(i)+Fij*zij/r; Fz(j)=Fz(j)-Fij*zij/r;
    end
end
    % este metodo de calculo do virial nao se pode usar
    % devido as condicoes fronteira periodicas
    %vir=x'*Fx+y'*Fy+z'*Fz;
    % ver Computer simulation of liquids M.P. Allen and D. J. Tildesley  pg
    % 48
    

end
