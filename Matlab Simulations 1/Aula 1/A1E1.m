%Ficha De Trabalho numero 1
clear all
%Tarefa 1
a = [1,1];
b = [1,-1];
c = [2,-5];
%Exercicio 1
am = [1:1];
bm = [1:-1];
cm = [2:-5];
av = [1,1];
bv = [1,-1];
cv = [2,-5];
% Resposta 1: A diferença é que com a virgula ele forma um vetor e com os
% ":" forma matrizes com [x,y] (x linhas, y colunas)


%Exercicio 2
normaa = norm(av);
normab = norm(bv);
normac = norm(cv);

%Exercicio 3
%norma = sqrt(a*a);  %*Não funciona
%clear norma
%norma = sqrt(a' * a')    %*Não funciona
%clear norma
norma = sqrt(a*a');
clear norma
norma = sqrt(sum(a.*a));
clear norma
%As únicas opções que funcionam são a A)e a D)