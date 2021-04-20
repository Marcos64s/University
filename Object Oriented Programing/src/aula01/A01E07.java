package aula01;

import java.lang.Math;
import java.util.Scanner;

public class A01E07 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double a,b,h,ang;
		System.out.print("Insira a A: ");
		a= sc.nextDouble();
		System.out.print("Insira a B: ");
		b= sc.nextDouble();
		h = Math.sqrt(a*a+b*b);
		System.out.printf("A hipotenusa é " + h);
		ang = Math.acos(a/h);
		System.out.print("e o Ang: " + ang);
		sc.close();
	}
}