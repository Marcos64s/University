import sys

def menu ():
	l1 = [1,2,3,4,5]
	op = 0
	while op not in l1:
		print ("1) Registar chamada")
		print ("2) Ler ficheiro")
		print ("3) Listar clientes")
		print ("4) Fatura")
		print ("5) Terminar")
		op = int (input ("0) Opção? "))

	return op

def validar (n):
	l1 = ["0","1","2","3","4","5","6","7","8","9"]
	lenNumber = len (n)
	if n[0] == "+":
		lenNumber -= 1
	if lenNumber < 3:
		return False

	for i in range (0, len(n)):

		if (i == 0 and n[i] != "+") or (i != 0) :
			if n[i] not in l1:
				return False

	return True

def novaChamada (text):
	numValido = False
	while numValido == False:
			number = input (text)
			numValido = validar (number)
	return number

def lerFicheiro (ficheiro):
	fil = open (ficheiro, "r")
	for line in fil:
		print (line)
	fil.close()

def sortNum (ficheiro):
	fil = open (ficheiro, "r")
	l1 = []
	listNum = []
	for line in fil:
		num = line.split()[0]
		if num not in listNum:
			listNum.append(num)
	listSorted = sorted(listNum)
	fil.close()
	return listSorted
	
def fatura (cliente):
	fil = open (ficheiro, "r")
	soma = 0
	for line in fil:
		if cliente == line.split()[0]:
			destino = line.split()[1]
			tempo = int(line.split()[2])
			if destino[0] == "2":
				custo = 0.02 * tempo / 60
			elif destino[0] == cliente[0] and destino[1] == cliente[1]:
				custo = 0.04 * tempo / 60
			elif destino[0] == "+":
				custo = 0.80 * tempo / 60
			else:
				custo = 0.10 * tempo / 60
			soma += custo
			print (destino, end = "\t")
			print (tempo, end = "\t")
			print (custo)
	print ()
	print (end = "\t")
	print (end = "\t")
	print ( "Total:" , end = "\t")
	print (soma)
	fil.close()
	
				


op = 0
while op != 5:
	op = menu()

	if op == 1:
		telOrigem = novaChamada ("Telefone origem? ")
		telDestino = novaChamada ("Telefone destino? ")
		tempo = "0"
		while tempo.isnumeric() == False or tempo == "0":
			tempo = input ("Duração (s)? ")
	elif op == 2:
		ficheiro = input ("Ficheiro? ")
		lerFicheiro("/home/fp/Desktop/Aula13/" + ficheiro)
	elif op == 3:
		print()
		ficheiro = input ("Ficheiro? ")
		listSorted = sortNum("/home/fp/Desktop/Aula13/" + ficheiro)
		print()
		print ("Clientes:", end=" ")
		for i in listSorted:
			print (i, end=" ")
		print()
		print()
	elif op == 4:
		print()
		cliente = input ("Cliente? ")
		print("Fatura do cliente " + cliente, ":")
		fatura (cliente)
		print()
		print()
