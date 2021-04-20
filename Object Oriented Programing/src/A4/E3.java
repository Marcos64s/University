package A4;

import java.util.Scanner;

public class E3 {

	public static void main(String[] args) {
		int op,nmec,nUtilizadores = 0,nLivros = 0,i;
		String nome, curso, condicao;

		Scanner sc = new Scanner(System.in);
		Utilizador alunos[] = new Utilizador[10];
		Livro catalogo[] = new Livro[10];

		do{
			do {// Menu
				System.out.println("\tMenu");
				System.out.println("1 - Inscrever o aluno");
				System.out.println("2 - Remover aluno");
				System.out.println("3 - Imprimir lista de Utilizadores");
				System.out.println("4 - registar um novo livro");
				System.out.println("5 - imprimir lista de livros");
				System.out.println("6 - emprestar");
				System.out.println("7 - Devolver");
				System.out.println("8 - Sair");
				System.out.println("Opção");
				op = sc.nextInt();
			}while ((op >8)||(op < 1));
			
			switch(op) {
			case 1: //Adicionar user
				System.out.println("Nome");
				nome = sc.next();
				System.out.println("Número Mecanografico");
				nmec = sc.nextInt();
				System.out.println("Curso");
				curso = sc.next().toUpperCase();
				alunos[nUtilizadores] = new Utilizador(nome, nmec, curso);
				nUtilizadores++;
				break;

			case 2 : // Remover User
				System.out.println("Qual o Utilizador a remover?");
				nome = sc.next();
				for(i = 0;i<nUtilizadores;i++)
					if (alunos[i].getNome().equals(nome)== true)
						alunos[i] = null;
					else
						System.out.println("Utilizador não existe");
				break;
			case 3 : // Lista de User
				for(i = 0;i<nUtilizadores;i++)
					System.out.println(alunos[i]);
				break;
			case 4 : //Registar livro
				System.out.println("Nome do Livro?");
				nome = sc.next();
				System.out.println("Regime de empréstimo?");
				condicao = sc.next().toLowerCase();
				catalogo[nLivros] = new Livro(nome,condicao);
				nLivros++;
				break;
			case 5 : //Lista de livros
				for(i = 0;i<nLivros;i++)
					System.out.println(catalogo[i]);
				break;
			case 6 : //Emprestar
				System.out.println("Emprestar o Livro?");
				nome = sc.next();
				for(i = 0;i<nLivros;i++)
					if(catalogo[i].getTitulo().equals(nome) == true)
						if(catalogo[i].getTipo().equals("condicional") == true)
							System.out.println("Não se pode emprestar");
						else {
							System.out.println("Pode se emprestar");
							catalogo[i] = null;
						}
				break;
			case 7: // Devolver
				System.out.println("Nome do Livro?");
				nome = sc.next();
				System.out.println("Regime de empréstimo?");
				condicao = sc.next().toLowerCase();
				catalogo[nLivros] = new Livro(nome,condicao);
				nLivros++;
				break;
			}
		}while(op != 8);
	}
}