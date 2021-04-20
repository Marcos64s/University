package aula01;
import java.util.Scanner;

public class A01E03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double C, F;
		System.out.print("Insira a Temperatura em Celcius: ");
		C = sc.nextDouble();
		F = C * 1.8 + 32 ;
		System.out.println("A Temperatura é " + F);
		sc.close();
	}
}