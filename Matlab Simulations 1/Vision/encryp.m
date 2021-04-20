close all
clear all
clc

file = fopen('Texto.txt', 'rb');    %Abrir
Str = fread(file, [1, inf], 'char'); %Ler
fclose(file);        %Fechar
Str=uint16(Str);       %Converter para 16 bit numere

im ='sonic.png';
normal=imread(im);   %Imagem a encriptar
normal=uint16(normal); %converter para 16 bit
[x_row,x_col]=size(normal);

c=numel(Str);   %contar os caracteres do ficheiro a encriptar
a=1;

delete decode.png; 

%Encriptar
for i=1:x_row/1.3 %garantir que todos se encontra dentro da imagem (x)
    for j=1:x_col/3 %garantir que todos se encontra dentro da imagem (y)
        if(a<=c)  %comparação entre o caracter com o numero "a" e o numero total de caracteres
            if(normal(i,j)+Str(a)>255)
                temp=normal(i,j)+Str(a)-256; %metodo
            else
                temp=normal(i,j)+Str(a); %metodo 2
            end
            z(i,j)=uint8(temp); %Criar a imagem atravez da matriz
        else
            z(i,j)=uint8(normal(i,j));%converter esse pixel da imagem para unit8
        end
        a=a+1; %avançar nos pixeis alterados da imagem 
    end
end

imwrite(z,'decode.png');     %Guardar a imagem com o código

%%%%%%%%%diferença entre unit8 e unit16
%Unit8 
% Intervalos de 0 - 255
%Unit16
% Intervalos de 0 - 65535