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
Sexp(t)=S;
St(t)=pfixo(c);
end

Sexp=Sexp./N;

figure(1)
plot(cv,Sexp,'-k',cv,St,'-b')