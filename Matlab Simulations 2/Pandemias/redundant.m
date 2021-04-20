function [x,y]=redundant(matrizn,x,y,mundo,modomundo)
for i = 1:length(x)
        if ((x(i)+1<matrizn)&&(y(i)+1<matrizn)&&(x(i)-1>0)&&(y(i)-1>0))&& ~((mundo(x(i)-1,y(i)-1)==modomundo&&mundo(x(i)+1,y(i)+1)==modomundo&&mundo(x(i)-1,y(i)+1)==modomundo&&mundo(x(i)+1,y(i)-1)==modomundo))
                x(i)=x(i);
                y(i)=y(i);
            else
                x(i)=NaN;
                y(i)=NaN;
        end
end
x=sparse(x);
y=sparse(y);
end