def menu():
    l = ['0','1','2','3','4','5','6']
    op = -1
    while op not in l:
        print('0 - Terminar')
        print('1 - Ler Ficheiro')
        print('2 - Imprimir Clientes')
        print('3 - Mostrar Matriculas por Cliente')
        print('4 - Adicionar pessoas ao Parque')
        print('5 - Gravar acessos ao parque')
        print('6 - Gerar fatura para um cliente')
        op = input('Opção? ')
    if op == '0':
        Terminar()
    elif op == '1':
        fin()
    elif op == '2':
        impcl()

menu()