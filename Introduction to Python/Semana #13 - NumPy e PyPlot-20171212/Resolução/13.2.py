def interface():
    fin = open('jornadas.csv')
    i = 0
    apostaspossiveis = ['1', '2', 'x']
    lfin = []
    x=input('A Jornada que aposta: ')
    if int(x) < 14:
        while i != 10:
            i = i + 1
            for line in fin:
                l = line.strip().split(',')
                if l[0] == str(x):
                    print(line)
                    y = input('Qual a Aposta: ')
                    if str(y) not in apostaspossiveis:
                        while str(y) not in apostaspossiveis:
                            y = input('Qual a Aposta: ')
                    l.append(str(y))
                    print(l)
                lfin = lfin.append(l)
    else:
        interface()
    print(l)
    guardaposta(l, x)
    fin.close()

def guardaposta(l, n):
    fin = open(('jornadas' + str(n) + '.txt'), 'w+')
    for i in range(len(l)):
        fin.write(str(i + 1) + ', ' + str(l[i]) + '\n')

def fichaposta(x):
    fich = open('Apostas_Geral.txt', 'w+')
    for i in x:
        fich.write('Jornada' + x + ':' + x[1] + ' vs ' + x[2] + ': ' + x[3] +'\n')
interface()
