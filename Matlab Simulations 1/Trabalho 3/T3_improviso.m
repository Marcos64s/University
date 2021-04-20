clear all;
close all;
clc;

i =10;

pos=[];
park = randperm(i);
v = 1;
park1(i)


for num = 1:i
    pos(1,num) = num;
    pos(2,num) = -1;
    pos(3,num) = 7;
end

for car = 1:i
    lg(pos(1,car),'og')
    pos
end

for car = 1:i
    while (pos(2,car) ~= park(car) || pos(3,car) ~=3)
        if pos(2,car) ~= park(car)
            pos(2,car) = pos(2,car) + v;
        else
            pos(3,car) = pos(3,car) - v;
        end
        for c = 1:i
            drawcarm(pos(2,c),pos(3,c),i)
            if pos(3,c)<4
                hold on
                lg(pos(2,c),'or')
            end
            pause(0.001)
        end
        hold off
        pos
    end
end

clf
park(i);


for car = 1:i
    lg(pos(1,car),'or')
end

for car = 1:i
    while (pos(2,car) ~= -1 || pos(3,car) ~= 7)
        if pos(3,car) == 7
            pos(2,car) = pos(2,car) - v;
        else
            pos(3,car) = pos(3,car) + v;
        end
        for c = 1:i
            drawcarm(pos(2,c),pos(3,c),i)
            if pos(3,c)<5
                lg(pos(2,c),'or')
            end
            pause(0.001)
            hold off
        end
    end
    pos
end


fprintf('Done.\n');