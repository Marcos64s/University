function [Emedio,E2medio, nkmedio,EF2] = metropolis_ex35(T ,nequi, nmedidas,N, nmax)
%Gas ideal Fermioes

%passo 1
[lv,nv]=listv3d_sem_cfp(nmax);
nk=zeros(nmax^3,1); nkmedio=nk;

estado_particula=zeros(N,1); % todas as particulas no estado k de menor energia.

for nx=1:nmax
    for ny=1:nmax
        for nz=1:nmax
            ik=nx+nmax*(ny-1)+nmax^2*(nz-1);
            Eestado(ik)=(nx^2+ny^2+nz^2)/4; % calcula a energia de cada estado
        end
    end
end
[Eestado_ordenado,ik_ordem]=sort(Eestado,'ascend'); %ordena em ordem crescente
% colocar particulas nos estados
E=0;
for i=1:N
    estado_particula(i)=ik_ordem(i);
    nk(ik_ordem(i))=1;
    E=E+Eestado_ordenado(i);
end

 EF2=Eestado_ordenado(N); % ENergia de Fermi =Estado de mais alta energia ocupado no estado fundamental


Emedio=0; E2medio=0;
npassos=nequi+nmedidas; % passo 2

for t=1:npassos
    for act=1:N
        ip=randi(N,1); %passo 2a
        ik=estado_particula(ip); 
        %passo 2b
        ikv=lv(ik,randi(nv(ik),1)); % estado vizinho de ik escolhido ao acaso de entre nv(ik)
        if (nk(ikv)==0 )
        nx=mod(ik-1, nmax)+1; ny=floor(mod(ik-1,nmax^2)/nmax)+1; 
        nz=floor((ik-1)/nmax^2)+1;
        
        % Epi=Eestado(ik);
        Epi=(nx^2+ny^2+nz^2)/4; % Para comparar com as expressões teóricas temos que usar
        %u_E= htraco^2 4 pi^ 2/(2 m L^2) 
        
        nxv=mod(ikv-1, nmax)+1; nyv=floor(mod(ikv-1,nmax^2)/nmax)+1; 
        nzv=floor((ikv-1)/nmax^2)+1;
        % Epf=Eestado(ikv);
        Epf=(nxv^2+nyv^2+nzv^2)/4; 
        
        dE=Epf-Epi;
        pA=min([1, ((nv(ik)*(nk(ikv)+1))/(nv(ikv)*nk(ik))) * exp(-dE/T)]);
        
        if rand(1) < pA
            estado_particula(ip)=ikv;
            nk(ik)=nk(ik)-1; nk(ikv)=nk(ikv)+1;
            E=E+dE;
        end 
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
