function [Emed]=metropolis(T,nequi,npassos,xh)

% valores de x
N=length(xh);
E=0;
Emed=0;

nmedidas=npassos-nequi;
for t=1:npassos
        % indice a alterar
        ip=randi(N,1);
        % posição varia
        x=xh(ip); 
        % dx
        dx = (2*rand(1)-1)*0.5/2;
        xfinal=x+dx;
        % Energia
        Ei = 0.2*x - x^2 + 2*x^4;
        Ef = 0.2*xfinal - xfinal^2 + 2*xfinal^4;
        % Variação
        dE=Ef-Ei;

        if rand(1)<min([ 1, (x*(xfinal + 1) * exp(-dE/T)) / (xfinal*x) ])
            x=xfinal;
            E=E+dE;
        else 
            x=x;
        end
    if t>nequi
        Emed=Emed+E;
    end
end
Emed=Emed/nmedidas;
nbins=10;
[h,x]=hist(Emed,nbins);
xmax=max(x); xmin=min(x);
dx=(xmax-xmin)/(nbins-1);
hn=h/(nmedidas*dx); %histograma normalizado
figure(2)
plot(x,hn,'k.')
end

            
           
        
        