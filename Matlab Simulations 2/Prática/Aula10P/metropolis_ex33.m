function [Emedio,E2medio, nkmedio] = metropolis_ex33(T ,nequi, nmedidas,N, nmax)

%passo 1
[lv,nv]=listv3d_sem_cfp(nmax);
nk=zeros(nmax^3,1); nkmedio=nk;

estado_particula=ones(N,1); % todas as particulas no estado k de menor energia.
E=3*N/4; %Energia inicial do sistema quando todas estao no estado k de mais baixa 3nergia
nk(1)=N; % todas as particulas estao no estado 1

Emedio=0; E2medio=0;
npassos=nequi+nmedidas; % passo 2

for t=1:npassos
    for act=1:N
        ip=randi(N,1); %passo 2a
        ik=estado_particula(ip); 
        %passo 2b
        ikv=lv(ik,randi(nv(ik),1)); % estado vizinho de ik escolhido ao acaso de entre nv(ik)
        nx=mod(ik-1, nmax)+1; ny=floor(mod(ik-1,nmax^2)/nmax)+1; 
        nz=floor((ik-1)/nmax^2)+1;
        
        Epi=(nx^2+ny^2+nz^2)/4; % Para comparar com as expressões teóricas temos que usar
        %u_E= htraco^2 4 pi^ 2/(2 m L^2) 
        
        nxv=mod(ikv-1, nmax)+1; nyv=floor(mod(ikv-1,nmax^2)/nmax)+1; 
        nzv=floor((ikv-1)/nmax^2)+1;
        Epf=(nxv^2+nyv^2+nzv^2)/4; 
        
        dE=Epf-Epi;
        pA=min([1, ((nv(ik)*(nk(ikv)+1))/(nv(ikv)*nk(ik))) * exp(-dE/T)]);
        
        if rand(1) < pA
            estado_particula(ip)=ikv;
            nk(ik)=nk(ik)-1; nk(ikv)=nk(ikv)+1;
            E=E+dE;
        end  
    end
   if t> nequi
            Emedio=Emedio+E;
            E2medio=E2medio+E^2;
            nkmedio=nkmedio+nk;
     end
end
Emedio=Emedio/nmedidas;
E2medio=E2medio/nmedidas;
nkmedio=nkmedio/nmedidas;

end
