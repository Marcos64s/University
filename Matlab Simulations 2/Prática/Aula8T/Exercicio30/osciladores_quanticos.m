function [Emedio,EDmedio]=osciladores_quanticos(N, E0,nequi, npassos) 
 
ni=zeros(N,1); 

%====================================
nmedidas=npassos-nequi; 
ED=E0; % Energia inicial do demon
E=N/2; %

EDmedio=0;
Emedio=0;
%===================================

for t=1: npassos  
    
    %numero de atualiza�coes e N
    for nact=1:N
        
    i=randi(N,1); % escolha do oscilador i
     
    % escolher aumentar ou diminuir com igual probabilidade
    na=rand(1);
    if na<=0.5
        %diminuimos NO(nx,ny) em uma unidade   
        % tendo em conta que o numero de fotoes não pode ser negativo
        if ni(i,1)>=1
           ni(i,1)=ni(i,1)-1;
           dE=-1; 
           E=E+dE;
           ED=ED-dE; 
        end
     
    else
        %aumentamos 
        % A energia do Demon é sempre positiva
        dE=1;  
        if ED>=dE
            ni(i,1)=ni(i,1)+1;
            E=E+dE;
            ED=ED-dE;
        end
           
    end
        
    end % end nact
    
%============================================================
  
    if t> nequi
        EDmedio=EDmedio+ED;
        Emedio=Emedio+E;
    end
    
    
end %end t

Emedio=Emedio/nmedidas; 
EDmedio=EDmedio/nmedidas;
end
