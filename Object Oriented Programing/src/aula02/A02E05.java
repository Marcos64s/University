package aula02;

import java.util.Scanner;

public class A02E05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int mes, ano;
		do {
			System.out.println("Qual o mes?");
			mes = sc.nextInt();
			System.out.println("Qual o ano?");
			ano = sc.nextInt();
			if((mes<12) || (mes>1))
				switch(mes) {
				case 1:
					System.out.println("31");
					break;
				case 3:
					System.out.println("31");
					break;
				case 5:
					System.out.println("31");
					break;
				case 7:
					System.out.println("31");
					break;
				case 8:
					System.out.println("31");
					break;
				case 10:
					System.out.println("31");
					break;
				case 12:
					System.out.println("31");
					break;
				case 2:
					if (ano % 4 == 0)
						System.out.println("28");
					
					else
						System.out.println("29");
					break;
				case 4:
					System.out.println("30");
					break;
				case 6:
					System.out.println("30");
					break;
				case 9:
					System.out.println("30");
					break;
				case 11:
					System.out.println("30");
					break;
				}
				
		}while((mes != 0) || (ano != 0) );
	}
}
