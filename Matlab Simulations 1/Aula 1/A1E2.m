%Tarefa 2
av = [1,1];
bv = [1,-1];
cv = [2,-5];

subplot(1,1,1)
subplot(1,2,2)
%Exercicio 1
ProdutoInternoEntreAeB = av*bv';
x = [0,0];
y = [0,0];
figure
quiver(x,y,av,bv,1,'b')

%Exercicio 2
x = [0,0,0];
y = [0,0,0];
z = [0,0,0];
avv = [1,1,0];
bvv = [1,-1,0];
vopc = cross(avv,bvv);
figure
quiver3(x,y,z,avv,bvv,vopc,0,'b')