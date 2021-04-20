function d = drawcarm(x,y,i)
plot(x,y,'s')
ylim([0 8])
xlim([0 i+1])
axis off
park(i)
%rectangle('Position',[x-0.25 y 0.5 2],'Curvature',0.2)
%hold off
end