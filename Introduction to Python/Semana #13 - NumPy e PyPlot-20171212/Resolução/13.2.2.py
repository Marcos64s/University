def interface():
    fich = open('jornadas.txt', 'w+')
    listaposs = ['1','2', 'X', 'x']
    jornadastotal = []
    l=[]
    jornada = input('Qual a Jornada? ')
    for line in fich:
        jornadas = line.strip().split(',')
        if jornadas[0] == str(jornada):
            print(line)
            aposta = input('Qual a Aposta? ')
            while aposta not in listaposs:
                aposta = input('Qual a Aposta? ')
        jornadastotal.append(line)
    print(jornadastotal)

interface()

def ola():
    l1 = [1, 3, 3 , 4]
    l1.append(2)
    print()
ola()

