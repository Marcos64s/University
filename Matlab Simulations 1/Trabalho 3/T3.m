clear all;
close all;
clc;
%%%%PARK LIMITS%%%%%%%%%
i=4;
v=1;
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%PARKING/PARKED%%%%
parking = randperm(i);
parked = [];
park(i)
for lights = 1:i
    lg(lights,'og')
end
%%%%%%%%%%%%%%%%%%%%%%%%

axis off

%%%%%%PARKING%%%%%%%%%%%
for spot = 1 : i
    random = parking(1,spot);
    for x = -1:v:random
        if x == random
            for y = 7:-v:3
                drawcar(x,y,i)
                hold off
                pause(0.1)
            end
        end
        drawcar(x,7,i)
        hold off
        pause(0.1)
    end
    lg(random, 'or')
    parked(1,spot) = random
end
%%%%%%%%%%%%CONTROL%%%%%%%%%%%%%%%%
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
            lg(random, 'og')
            for x = random:-v:-1
                drawcar(x,7,i)
                pause(0.1)
            end
        end
        drawcar(random,y,i)
        pause(0.1)
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ylim([0 8])
xlim([0 i+1])