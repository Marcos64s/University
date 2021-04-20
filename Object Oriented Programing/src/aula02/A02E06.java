package aula02;

import java.util.Scanner;
import java.util.Random;

public class A02E06 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int e;
		Random r = new Random();
		int n = r.nextInt(101);
		System.out.println(n);
		do {
			System.out.println("Qual o numero?");
			e = sc.nextInt();
			if (n != e)
				if (e < n)	
					System.out.println("Cima");
				else
					System.out.println("Baixo");
		}while(e != n);
		System.out.println("Parabens acertaste o numero é "+n);
	}
}
