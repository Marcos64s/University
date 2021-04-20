clear all;
close all;
clc;

i = 6;

pos=[];
park = randperm(i);
v = 0.5;
park1(i)

for lights = 1:i
    lg(lights,'og')
end

for num = 1:i
    pos(1,num) = num;
    pos(2,num) = -1;
    pos(3,num) = 7;
end

pos

for spot = 1 : i
    random = park(1,spot);
    if spot > 1
        for pcar = 1:spot-1
            lg(parked(pcar),'or')
        end
    end
    %x = pos(2,spot);
    %y = pos(3,spot);
    while (pos(2,spot) ~= random || pos(3,spot) ~=3)
        if pos(2,spot)~=random
            pos(2,spot) = pos(2,spot) + v;
            drawcarm(pos(2,spot),pos(3,i),i)
            hold off
            pause(0.1)
            
        else 
            pos(3,spot) = pos(3,spot) - v;
            drawcarm(pos(2,spot),pos(3,spot),i)
              
            hold off
            pause(0.1)
        end 
    end
    parked(1,spot) = random;
end