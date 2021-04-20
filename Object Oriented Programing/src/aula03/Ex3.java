package aula03;

import java.util.Scanner;

public class Ex3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int dia = 0,mes = 0,c = 0,ano = 0,ddm = 0,dds = 0,i = 0;

		do {
			System.out.println("Dia?");
			dia = sc.nextInt();
			System.out.println("Dia da Semana?");
			dds = sc.nextInt();
			System.out.println("Mês?");
			mes = sc.nextInt();
			System.out.println("Ano?");
			ano = sc.nextInt();
		}while(dia<0||dia>31||mes<0||mes>12||ano<0);

		switch (mes) {
		case (1):
			ddm = 31;
		case (3):
			ddm = 31;
		case (5):
			ddm = 31;
		case (7):
			ddm = 31;
		case (8):
			ddm = 31;
		case (10):
			ddm = 31;
		case (12):
			ddm = 31;
		case (4):		
			ddm = 30;
		case (6):		
			ddm = 30;
		case (9):		
			ddm = 30;
		case(11):		
			ddm = 30;
		}

		if(ano%4 == 0 && ano%100 != 0)
			switch (mes) {
			case 2:
				ddm = 29;
			}
		else
			switch (mes) {	
			case 2:
				ddm = 28;
			}
		System.out.print("---------------------------------------------------\r\n|Mo\tTu\tWe\tTh\tFr\tSa\tSu|\r\n---------------------------------------------------\r\n|");
			for(c=1;c<=ddm+1;c++) {
				if (c == 1)
					
				System.out.print(c + "\t");
				if(c%7 == 0)
					System.out.print("|\n|");
			}
		}
	}

}
