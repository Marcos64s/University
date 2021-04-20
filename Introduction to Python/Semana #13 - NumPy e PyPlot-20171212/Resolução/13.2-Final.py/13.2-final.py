def aposta():
    listaapostaspossivel = ['1', '2', 'x']
    f = open('Jornadas.csv', 'r+')
    for line in f:
        l = line.split(',')
        print('Jornada ' + l[0] + 'º ' + ' : ' + l[1] + ' vs ' + l[2])
        aposta = input('Qual a aposta? ')
        while aposta not in listaapostaspossivel:
            aposta = input('Qual a aposta? ')
        guardaraposta(line, aposta)



def guardaraposta(line1, aposta):
    lfin = line1.rstrip().split(',')
    fichnov = str('Jornadas' + str(lfin[0]) + '.txt')
    f = open(fichnov, 'a')
    f.write(lfin[0] + ' ' + lfin[1] + ' vs ' + lfin [2] + ': ' + str(aposta) + '\n')


def mostrar():
    fjogos = open('jogos.csv', 'r+')
    for line in fjogos:
        l = line.rstrip().split(',')
        print (l[0] + ' # ' + l[1]+ ' ' + l[3] + '-' + l[4] + ' ' + l[2])

def resultados(): # Mostrar os resultados
    numerodajornada = str(input('Qual o numero da Jornada? '))
    fopen = open('Jornadas.csv', 'r+')
    fres = open('Jogos.csv', 'r+')
    fapo = open('Jornadas' + numerodajornada + '.txt', '+r')
    i = 0
    c = 0
    print('Jornada ' + numerodajornada)
    for line in fopen:
        i = i + 1
        l = line.rstrip().split(',')
        if l[0] == numerodajornada:
            for line in fres:
                lres = line.rstrip().split(',')
                if (l[1] and l[2]) in lres:
                    c = c + 1
                    if str(c) == numerodajornada:
                        c =0
                    print(str(i)+ ' ' + l[1] + ' ' + lres[3] + '-' + lres[4] + ' ' + l[2])
        else:
            i = 0


#print( i + '  ' + jogacasa + ' ' + pontoscasa + '-' + pontosfora + ' ' + jogafora + '   :' + aposta + resultadoaposta)


def menu():
    listapossiveis = ['1', '2', '3']
    op = 0
    while op not in listapossiveis:
        print('1 - Aposta')
        print('2 - Mostrar Jogos')
        print('3 - Resultados das apostas')
        op = str(input('Opção? '))
    if op == '1':
        aposta()
    elif op == '2':
        mostrar()
    else:
        resultados()

menu()