
function [Emedio,EDmedio]=osciladores_classicos(N, E0,nequi, npassos)

v=zeros(N,1);
r=zeros(N,1);

nmedidas=npassos-nequi;

%para a perturbacao
delta=sqrt((2*E0)/(10*N));


%====================================

ED=E0; % Energia inicial do demon
E=0;

EDmedio=0;
Emedio=0;
%===================================


for t=1: npassos 
    
    %considerar n atualiza�oes
    for nact=1:N
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    %escolher o oscilador
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ip=randi(N,1);
    %---------dx==perturba�ao==dv------------
    dr=(2*rand(1,1)-1)*delta;
    dv=(2*rand(1,1)-1)*delta;
    %--------------------------------
    dE=dot(v(ip,:),dv)+0.5*dot(dv,dv);
    dE=dE+dot(r(ip,:),dr)+0.5*dot(dr,dr);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %VARIACAO DEMON
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if dE<=0
           % aceitamos a perturbacao
           v(ip,:)=v(ip,:)+dv;
           r(ip,:)=r(ip,:)+dr;
           E=E+dE;
           ED=ED-dE;
        else
            if dE<=ED
               v(ip,:)=v(ip,:)+dv;
               r(ip,:)=r(ip,:)+dr;
               E=E+dE;
               ED=ED-dE; 
            end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
        
    end
    
   
    if t> nequi
        EDmedio=EDmedio+ED;
        Emedio=Emedio+E;
    end

end 


 Emedio=Emedio/nmedidas;
 EDmedio=EDmedio/nmedidas;
%============================================================

end 