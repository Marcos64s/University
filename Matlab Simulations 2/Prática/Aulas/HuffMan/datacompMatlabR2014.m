function datacompMatlabR2014()
%compressao de dados
%versao compativel com Matlab R2014 e R2019b
close all
clear all
clc
% leitura do texto 
% O vetor A e' um vector de carateres
fid=fopen('MobyDickChapter1.txt','r');
A=fread(fid,'*char');
A=A';
fclose(fid);

l1=numel(A); %numero de caracteres
na=double(A);
A=A(na>0); % ha um caracter nao reconhecido pelo Matlab R2014 que vem com codigo ascii negativo e este carater e' eliminado
% O Matlab R2019b reconhece esse caracter

na=double(A);
caracter2ascii=unique(na); %identifica o conjunto de caracteres usado
%caracter2ascii
ascii_max=max(caracter2ascii);
ascii2caracter=-ones(1,ascii_max); % para converter de ascii para indice de carater
%valor -1 significa carater nao usado
l2=numel(caracter2ascii); % numero de caracreres usados pelo texto
for i=1:l2
    ascii2caracter(caracter2ascii(i))=i-1;
end
h=zeros(l2,1); %histograma dos caracteres
nbits_ascii=ceil(log2(ascii_max)); % numero de bits necessario para escrever codigos ascii

fprintf(1,'Capitulo 1 do livro Moby Dick or the Whale por Herman Melville\n');
fprintf(1,'Numero de caracteres do texto=%d caracteres\n',l1);
fprintf(1,'Numero diferente de  caracteres usados=%d\n',l2);
fprintf(1,'Comprimento do texto registando codigos ascii com %d bits=%d bits=%f KB\n',nbits_ascii,l1*nbits_ascii,l1*nbits_ascii/8/1024);

for i=1:l2
    h(i)=h(i)+numel(strfind(A,char(caracter2ascii(i))));
end
h=h/sum(h);
%ps=ceil(-log2(h));
ps=-log2(h); %numero de bits otimo para cada carater
S=-sum(h.*log2(h)); %entropia em base 2
figure(1)
subplot(2,1,1)
plot( h)
xlabel('caracter'); ylabel('p(caracter)');
subplot(2,1,2)
plot(ps)
xlabel('caracter'); ylabel('nbits');

nbits=ceil(log2(l2)); %numero de bits necessarios usando 
%numero de bits constante para cada caracter
fprintf(1,'Comprimento do texto registando codigos com %d bits=%d bits= %f KB\n',nbits,l1*nbits,l1*nbits/8/1024);

dados_nao_comprimidos_ascii=[]; % com codigos ascii em binario
for i=1:l1
 [str]=binario_nbits(na(i),nbits_ascii);
dados_nao_comprimidos_ascii=[dados_nao_comprimidos_ascii, str];
end
%%%%
dados_nbits_fixo=[]; % com codigos caracteres identificados com nbits fixo
for i=1:l1
 [str]=binario_nbits(ascii2caracter(na(i)),nbits);
dados_nbits_fixo=[dados_nbits_fixo, str];
end
% codigo otimo determinado pelo algoritmo de Huffman
[codigo_opt]=huffman(h);


for i=1:l2
    %nb_huffman(i)=numel(convertStringsToChars(codigo_opt(i)));
    nb_huffman(i)=numel(char(codigo_opt(i)));
end

figure(1)
subplot(2,1,2)
hold on
plot(nb_huffman,'r-')
Lmed=sum(h.*nb_huffman');
fprintf('Entropia=%f, L_opt=%f, sum(2^(-lw)=%f\n',S,Lmed,sum(2.^(-nb_huffman)));
 %dados_compressao_otima
 dados_compressao_otima=[];
for i=1:l1
 %dados_compressao_otima=[dados_compressao_otima convertStringsToChars(codigo_opt(ascii2caracter(na(i))+1))];
 dados_compressao_otima=[dados_compressao_otima char(codigo_opt(ascii2caracter(na(i))+1))];  
end
lotimo=numel(dados_compressao_otima);
fprintf(1,'Comprimento do texto compressao otima (N=1) = %d bits=%f KB\n',lotimo,lotimo/8/1024);

texto=descodificador(dados_compressao_otima,codigo_opt,nb_huffman,caracter2ascii,h);

if sum(texto-na)==0
    fprintf(1,' O texto comprimido e descodificado coincide com o texto original\n')
else
    fprintf(1,' Erro na compressao e descompressao\n')
end

end

function texto=descodificador(dados,codigo,nb_codigo,caracter2ascii,h)
l1=numel(dados); l2=numel(codigo);
[h,is]=sort(h,'descend'); % para come?ar a procurar pelos mais frequentes
nb_codigo=nb_codigo(is); codigo=codigo(is); caracter2ascii=caracter2ascii(is);
n=0;nc=0;
while n<l1
    for i=1:l2
       % if strcmp(convertStringsToChars(codigo(i)),dados(n+1:n+nb_codigo(i)))
        if strcmp(codigo(i),dados(n+1:n+nb_codigo(i)))
            nc=nc+1; n=n+nb_codigo(i);
            texto(nc)=caracter2ascii(i);
            break;
        end
    end
end
end
    

function [str]=binario_nbits(dec,nbits)
str=[];%strings(1,nbits);
for i=1:nbits
bit=floor(dec/2^(nbits-i)); 
dec=dec-bit*2^(nbits-i);
if (bit==1)
    str=[str '1'];
elseif (bit==0)
   str=[str '0']; 
else
fprintf(1,'Erro: numero demasiado grande para %d bits\n',nbits);    
end
end
end

function [codigo]=huffman(p)
palfa=p;nsimbol=numel(p);
salfa=nsimbol; alfa=1:salfa; nalfa=salfa;
codigo=cellstr(repmat(' ',nalfa,1));

 while(salfa>1)
     % encontrar o minimo de prob e reira-lo do alfabeto
     [palfa1,i1]=min(palfa(1:salfa)); alfa1=alfa(i1); palfa(i1)=palfa(salfa); 
     alfa(i1)=alfa(salfa); salfa=salfa-1;
     % repetir
     [palfa2,i2]=min(palfa(1:salfa)); alfa2=alfa(i2); palfa(i2)=palfa(salfa);
     alfa(i2)=alfa(salfa); salfa=salfa-1;

     % adicionar o pai ao alfabeto alargado
     nalfa=nalfa+1; 
     salfa=salfa+1; alfa(salfa)=nalfa; palfa(salfa)=palfa1+palfa2;
    
      filho1(nalfa)=alfa1; filho2(nalfa)=alfa2;
  
 end 
 str=[];
 [str1,str2,codigo]=percorre_filhos(filho1,filho2,nalfa,str,nsimbol,codigo);
 
end
 
 function [str1,str2,codigo]=percorre_filhos(filho1,filho2,nodo,str,nsimbol,codigo)
                str10=[str '0'];str20=[str '1'];
                if (filho1(nodo) >0 )
                    nodo1=filho1(nodo); 
                    [str1,str2,codigo]=percorre_filhos(filho1,filho2,nodo1,str10,nsimbol,codigo);
                end
                 if (filho2(nodo)>0)
                    nodo2=filho2(nodo);
                    [str1,str2,codigo]=percorre_filhos(filho1,filho2,nodo2,str20,nsimbol,codigo);
                 end
                  if (filho1(nodo)<=0 && filho2(nodo)<=0)
                       str1=str; str2=str;
                       codigo(nodo)=cellstr(str);    
                    return
                  end
                return
 end