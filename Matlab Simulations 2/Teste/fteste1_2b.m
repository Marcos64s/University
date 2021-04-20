function [Emed,EDmed]=fteste1_2b(N,E0,nequi, npassos)

n1=ceil(rand()*N);
n2=N-n1;

ED = E0;
E=n2-n1;%Energia inicial do oscilador (despresar tudo o que é 0)
caixa=ones(1,N);
caixa(n1:n2)=-1;

E = sum(caixa);
ED = E0-E;
nmedidas = npassos-nequi;

Emed = 0; EDmed = 0;
for t = 1:npassos
    for nact = 1:N
        a = randi(N,1); % rand
        n1=sum(caixa==-1);
        n2=sum(caixa==1);
        dE = n2-n1;
        if (n1~=N)||(n2~=N)
            if dE < 0 % aceitamos~~
                caixa(a) = (-1)*caixa(a);
                E = E+dE;
                ED = ED-dE;
            else
                if dE <= ED
                    caixa(a) = (-1)*caixa(a);
                    E = E+dE;
                    ED = ED-dE;
                end
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