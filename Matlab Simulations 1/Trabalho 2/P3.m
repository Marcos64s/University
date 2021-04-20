close all
clear all
clc
%%%%%%%%%%%%%%%%%%Video Reader%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mv=VideoReader('sm.mp4');
nframes=int32(mv.Duration*mv.FrameRate);
n=5;
load x1
load y1
%%%%%%%%%%%%%%%%%%%%%%%Seleção de pontos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:n:nframes
%     for j=1:n
%         mov=readFrame(mv);
%     end
%     image(mov);
%     if (i>2795 && i<2950)
%         title(strcat('Frame',num2str(i),' Ponto ',num2str(1)));
%         [x1(i), y1(i)]=ginput(1);
%     end
%     impixelinfo;
% end
% %
% %%%%%%%%%%%%%%%%%%%%%%Polinómio%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=polyfit(x1,y1,2);
x = -10:0.5:40;
y = a(1)*x.^3+a(2)*x.^2+a(3)*x;
%
%
ypol = interp1(x,y,x1,'cubic');
hold on
plot(x,y,'-k')
plot(x1,ypol,'-r')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
for i=1:n:nframes
    for j=1:n
        mov=readFrame(mv);
    end
    if (i>2795 && i<2950)
        image(mov)
        F(i) = getframe;
    end
end
