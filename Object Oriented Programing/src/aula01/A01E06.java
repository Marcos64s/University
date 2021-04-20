package aula01;

import java.lang.Math;
import java.util.Scanner;

public class A01E06 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		double p1x, p1y,p2x, p2y, d;
		System.out.print("Insira a P1x: ");
		p1x= sc.nextDouble();
		System.out.print("Insira a P1y: ");
		p1y= sc.nextDouble();
		System.out.print("Insira a P2x: ");
		p2x= sc.nextDouble();
		System.out.print("Insira a P2y: ");
		p2y= sc.nextDouble();
		d = Math.sqrt((p2x-p1x)*(p2x-p1x)+(p2y-p1y)*(p2y-p1y));
		System.out.printf("A Distancia final é " + d);
		sc.close();
	}
}