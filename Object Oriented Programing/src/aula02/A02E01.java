package aula02;

import java.util.Scanner;

public class A02E01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double notap, notat, notaf;
		System.out.println("Nota Prática?");
		notap = sc.nextDouble();
		System.out.println("Nota Teorica?");
		notat = sc.nextDouble();
		notaf = 0.4*notat+notap*0.6;
		if (notaf < 7)
			System.out.println("66");
		else if ( notaf < 9.5)
			System.out.println("Reprovado");
		else
			System.out.println("Passou");
	}

}
