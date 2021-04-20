function [Epnova,dE]=EPLJ_Nova(L,N,r,rni,i,Ep)

 rmin=0.8;
 dE=0;
vmax=4*(rmin^(-12)-rmin^(-6));
x=r(:,1);y=r(:,2);z=r(:,3);

xni=rni(1); yni=rni(2);zni=rni(3);

Epnova=Ep;

    for j=1:N
        if (i ~= j) 

        xij=x(i)-x(j); yij=y(i)-y(j);zij=z(i)-z(j);
        
         xij=xij-L*round(xij/L);
         yij=yij-L*round(yij/L);
         zij=zij-L*round(zij/L);
        
        r=sqrt(xij^2+ yij^2+zij^2);
        if (r<rmin)
            Epnova(i)=Epnova(i)-vmax;
            Epnova(j)=Epnova(j)-vmax;
            dE=dE-vmax;
        else
           cont=4*(r^(-12)-r^(-6));
           Epnova(i)=Epnova(i)-cont; 
           Epnova(j)=Epnova(j)-cont; 
           dE=dE-cont;
        
        end
        
        
        xij=xni-x(j); yij=yni-y(j);zij=zni-z(j);
        
         xij=xij-L*round(xij/L);
         yij=yij-L*round(yij/L);
         zij=zij-L*round(zij/L);
        
        r=sqrt(xij^2+ yij^2+zij^2);
        if (r<rmin)
            Epnova(i)=Epnova(i)+vmax;
            Epnova(j)=Epnova(j)+vmax;
            dE=dE+vmax;
        else
           cont=4*(r^(-12)-r^(-6));
           Epnova(i)=Epnova(i)+cont; 
           Epnova(j)=Epnova(j)+cont; 
           dE=dE+cont;
        
        end
              
        end
    end
   

end
