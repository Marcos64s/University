clear all;close all;clc
N=10^3;
cv=0.5:0.1:2;
t=0;
for c=cv
t=t+1;
[listv,nv, lista_sitios]=rg(N, c);
for i=transpose(unique(lista_sitios))
    tamanho_comp(i)=sum(lista_sitios==i);
end
[S,lmax]=max(tamanho_comp);
sp=[tamanho_comp(1:lmax-1),tamanho_comp(lmax+1:end)];
spequenoexp(t)=sum(sp.^2)./sum(sp);
end


figure(1)
plot(cv,spequenoexp,'-k')