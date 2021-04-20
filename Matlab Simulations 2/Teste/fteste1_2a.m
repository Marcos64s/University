function [Emed,EDmed]=fteste1_2a(N,E0,nequi,npassos)

nmedidas = npassos-nequi;

caixa = (-1)*ones(N,1);

E = sum(caixa);
ED = E0-E;


Emed = 0; EDmed = 0;
for t = 1:npassos
    for nact = 1:N
        a = randi(N,1); % rand
        dE = -2*caixa(a);
        if dE < 0 % aceitamos~~
            caixa(a) = (-1)*caixa(a);
            E = E+dE;
            ED = ED-dE;
        else
            if dE <= ED  % 
                caixa(a) = -caixa(a);
                E = E+dE;
                ED = ED-dE;
            end
        end
    end % end nact
    if t > nequi
        EDmed = EDmed + ED;
        Emed = Emed + E;
    end
end
Emed = Emed/nmedidas;
EDmed = EDmed/nmedidas;

end