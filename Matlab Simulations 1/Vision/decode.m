close all
clear all
clc

x=imread('decode.png');  %Ler com codigo
y=imread('sonic.png');   %Ler sem codigo

x=uint16(x);    %16 bit 
y=uint16(y);    %16 bit 

[x_row, x_col]=size(x);

b=0;k=1;
%Decode
for i=1:x_row %precorer a imagem completa (x)
    for j=1:x_col%precorrer a imagem completa (y)
        if(x(i,j)>=y(i,j)) %Compara os valores presentes nas duas imagens
            a=x(i,j)-y(i,j); %Para dar uma cor neutra
        else
            a=256+x(i,j)-y(i,j); %Para descodificar utiliza-se o inverso do algoritmo atrás
        end
        
        if(a~=0)
            z(k)=uint8(a);
            k=k+1; %Criada uma matriz com os valores a descodificar
        else
            b=1;
            break;
        end
    end
    if(b==1)
        break;
    end
end

file=fopen('decrypted.txt','w'); %Criar Ficheiro
for i=1:k-1
    fprintf(file,'%c',z(i)); %Escrever no fcheiro
end
fprintf(file,'%s',[newline newline 'Traduzido pelo programa "Decode" de Marcos Mendes' newline 'Esta descodificação foi feita em Matlab']);