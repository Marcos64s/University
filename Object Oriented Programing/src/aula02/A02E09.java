package aula02;

import java.util.Scanner;

public class A02E09 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		byte num;
		System.out.println("Qual o numero?");
		num = sc.nextByte();
		for(byte i = num; i!= 2;i++ )
			System.out.print(i);
	}
}