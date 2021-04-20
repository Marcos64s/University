def menu():
    while True:
        print('		Qual  a opção a escolher? ')
        print('1) Registar chamada')
        print('2) Ler ficheiro')
        print('3) Listar clientes')
        print('4) Fatura')
        print('5) Terminar')

        op = input('Qual  a opção ')

        if op == "1": #Registar Chamada
            numeroi = inputPhone("Origem?")
            numerof = inputPhone('Destino?')
            reg(numeroi, numerof)
        elif op == "2": #Ler Ficheiro
            fic = lerfi()
        elif op == "3": #Listar Clientes
            clients(fic)
        elif op == "4": #Fatura
            fat()
        elif op == "5": #Terminar
            break
    print("FIM")

def inputPhone(x):
    print(x)
    numero = input()
    if val(numero) == True:
        return numero
    else:
        return inputPhone(x)

def reg(numeroi, numerof):
    lcont=[]
    lcont.append(numeroi)
    lcont.append(numerof)
    print('Qual a duração?')
    time = int(input())
    lcont.append(time)
    print(lcont)

def val(numero):
    return (numero.isdigit() and len(numero)>=3) or (len(numero)>=4 and numero[0] == '+' and numero[1:].isdigit())

def lerfi():
    print('O nome do ficheiro')
    file = str(input())
    if file == False:
        while file == False:
            print('O nome do ficheiro')
            f = open(file, 'r')
            return f.read()
    else:
        f = open(file, 'r')
        return f.read()

def clients(f):
        print('Nº dos sócios: ')
        lines = f.split("\n")
        for line in lines:
            print(line.split("\t")[0])
        return



menu()