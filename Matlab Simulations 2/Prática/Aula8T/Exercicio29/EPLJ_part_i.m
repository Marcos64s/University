function [Ep]=EPLJ_part_i(L,N,r,i)

Ep=0;  rmin=0.8;

vmax=4*(rmin^(-12)-rmin^(-6));
x=r(:,1);y=r(:,2);z=r(:,3);


    for j=1:N
        if (i ~= j) 
        xij=x(i)-x(j); yij=y(i)-y(j);zij=z(i)-z(j);
        
         xij=xij-L*round(xij/L);
         yij=yij-L*round(yij/L);
         zij=zij-L*round(zij/L);
        
        r=sqrt(xij^2+ yij^2+zij^2);
        if (r<rmin)
            Ep=Ep+vmax;
          
        else
        Ep=Ep+4*(r^(-12)-r^(-6)); 
        
        end
       
        end 
    end
   

end
