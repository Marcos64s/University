function [out]=circular(v)
tamanho=length(v);
a=toeplitz(v, [1 zeros(1,tamanho-1)]);
matrix=flip(a');
out=[matrix flip(matrix)';flip(matrix) flip(flip(matrix)')];
out(:,tamanho)=[];
out(tamanho,:)=[];
end
