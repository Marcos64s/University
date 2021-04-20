function d = drawcar(x,y,i)
plot(x,y,'s')
ylim([0 8])
xlim([0 i+1])
park(i)
axis off
%rectangle('Position',[abs(x) abs(y) abs(x*1.5) abs(y*1.75)],'Curvature',0.2)
end