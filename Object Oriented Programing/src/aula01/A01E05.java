package aula01;
import java.util.Scanner;

public class A01E05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int s, m, h,mm;
		System.out.print("Insira os segundos: ");
		s = sc.nextInt();
		h = s / 3600;
		m = (s % 3600);
		mm = (m / 60);
		s= (m%60);
		System.out.println("O tempo é " + h + ":" + mm + ":" + s);
		sc.close();
	}
}
