mv=VideoReader('n.mp4');
nframes=int32(mv.Duration*mv.FrameRate);
n=5;
for i=1:n:nframes
    for j=1:n
        mov=readFrame(mv);
    end
    if i>2800 && i<2950
        image(mov);
        title(strcat('Frame',num2str(i),' Ponto ', ' cabeca'));
        [x1(i) y1(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','pescoco'));
        [x2(i) y2(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','bracodireito'));
        [x3(i) y3(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','bracoesquerdo'));
        [x4(i) y4(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','costasbaixo'));
        [x5(i) y5(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','pernadireita'));
        [x6(i) y6(i)]=ginput(1);
        title(strcat('Frame',num2str(i),' Ponto ','pernaesquerda'));
        [x7(i) y7(i)]=ginput(1);
    end
end