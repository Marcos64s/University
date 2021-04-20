package aula03;

import java.util.Scanner;

public class E2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i;
		
		System.out.println("Qual o texto?");
		String p = sc.nextLine();
		
		char a[] = new char[p.length()];
		
		for (i=0;i<p.length();i++)
			a[i] = p.charAt(i);
		System.out.println("O paragrafo, contem " + i + " caracteres.");
		
		System.out.println("O paragrafo tem " + p.trim().split("\\s+").length + " palavra");
		
		System.out.println("O paragrado tem " + (p.trim().split("[\\.\\?!]").length) +" frases");
		
		for(String str : (p.trim().split("[\\.\\?!]")))
			System.out.println(str);
		
		sc.close();
	}

}
