function [Emed,EDmed]=Osciladores_quanticos(N,E0,npassos,nequi)

p = zeros(N,1);
x = zeros(N,1);
nq = zeros(N,1);

ED = E0;
E=N/2;

Emed = 0;
EDmed=0;

npassos=npassos+nequi;
for t=1:npassos
    for i=1:N
        a = randi(N,1);
        if rand() <= 0.5 
            if (nq(a)>=1)
                nq(a)=nq(a)-1;
                dE=-1;
                E=E+dE;
                ED=ED-dE;
            end
        else
            dE=1;
            if dE<=ED
                nq(a)=nq(a)+1;
                E=E+dE;
                ED=ED-dE;
            end  
        end 
    end
        
    if t>nequi
        EDmed=EDmed+ED;
        Emed=Emed+E ;
    end
    
end %end t
Emed=Emed/npassos;
EDmed=EDmed/npassos;
end