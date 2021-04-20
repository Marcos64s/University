package aula02;

import java.util.Random;
import java.util.Scanner;

public class A02E07 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int count;
		String resultado;
		double notat, notap, notaf;
		Random r = new Random();
		System.out.println("NotaT	NotaP	Pauta	Resultado");
		for(count = 0; count <= 16; count++) {
			notat = r.nextDouble()*20.1;
			notap = r.nextDouble()*20.1;
			notaf = 0.4*notat+notap*0.6;
			if (notaf < 7)						
				notaf = 66;
			if ((0.4*notat+notap*0.6) < 9.5)
				resultado = "Reprovado";
			else
				resultado = "Aprovado";
			System.out.printf("%.1f\t%.1f\t%.0f\t%s\n",notat, notap, notaf ,resultado);
		}
	}	
}
