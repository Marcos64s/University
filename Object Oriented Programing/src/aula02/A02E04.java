package aula02;

import java.util.Scanner;

public class A02E04 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int valor1, soma, media, max, min,n;
		n = soma = media = max = min = valor1 = 0;
		do {
			System.out.println("Qual o numero?");
			valor1 = sc.nextInt();
			System.out.println(valor1);
			if (n == 0)
				min = valor1;
			n = n + 1;			
			soma = soma + valor1;
			media = (media + valor1)/2;
			if (valor1>max)
				max = valor1;
			else if(valor1<min)
				min = valor1;
			System.out.println("Numero de Valores: "+ n);
			System.out.println("Soma: "+ soma);
			System.out.println("Média: "+ media);
			System.out.println("O valor máximo  é "+ max + " e o minimo é "+ min);
		}while(valor1 != 0);
	}
}