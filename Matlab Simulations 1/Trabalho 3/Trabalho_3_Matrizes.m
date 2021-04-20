clear all;
close all;
clc;
%%%%PARK LIMITS%%%%%%%%%
i=6;
v=1;
%%%%%%%%%Matrix%%%%%%%%%
pos=[]; pos(3,i) = 0;
for number = 1:i
    pos(1,number) = number;
    pos(2,number) = -1;
    pos(3,number) = 7;
end
%%%%%%PARKING/PARKED%%%%
parking = randperm(i);
parked = [];
park(i)

%%%%%%%%%%%%%%%%%%%%%%%%

axis off

%%%%%%PARKING%%%%%%%%%%%
for spot = 1 : i
    random = parking(1,spot);
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
%%%%%%%%%%%CONTROL%%%%%%%%%%%%%%%%
clf
park(i)
for lights = 1:i
    lg(lights,'or')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%PARKED%%%%%%%%%%%%%%%%%
for spot = 1:i
    for element = parked(1,spot)
        drawcar(spot,3,i)
    end
end
%%%%%%%%%%OUT OF PARK%%%%%%%%%%%%%%%
for spot = 1 : i
    random = parked(1,spot);
    for y = 3:v:7
        if y == 7
            for x = random:-v:-1
                drawcar(x,7,i)
                hold off
                pause(0.1)
            end
        end
        drawcar(random,y,i)
        hold off
        pause(0.1)
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ylim([0 8])
xlim([0 i+1])