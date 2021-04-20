package aula02;

import java.util.Scanner;

public class A02E03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int v,count;
		count = 0;
		System.out.println("Qual o Numero?");
		v = sc.nextInt();
		do {
			for (int i = v; i > 0; i--)
				if (v%i == 0) {
					count = count + 1;
				}
		}while(v<0);
		
		if (count >= 3) {
			System.out.println("Não é Primo");
		}
		else {
		System.out.println("É primo ");
		}
	}
}
