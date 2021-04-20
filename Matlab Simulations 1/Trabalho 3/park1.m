function park1(i)
for ps = 1:i+1
    hold on
    line([ps - 0.5 ps-0.5], [0 5], 'Color', 'black' ,'LineStyle','--')
end
axis off
line([0 i+0.5], [0 0], 'Color', 'black')
end
