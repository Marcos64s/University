package aula02;

import java.util.Scanner;

public class A02E02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int a, n;
		System.out.println("Qual o numero?");
		n = sc.nextInt();
		for (int i = n; i >= 0; i--)
			System.out.println(i);
	}
}
