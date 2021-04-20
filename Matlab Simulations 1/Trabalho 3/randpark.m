function r = randpark(i)
random = randperm(i);
while (round(random) == 0 || round(random) > i)
    random = randperm(i);
end
r = round(random);
end
