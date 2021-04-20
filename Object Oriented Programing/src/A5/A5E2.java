package A5;

public class A5E2 {

	public static void main(String args[]) {
		ponto p1 = new ponto(5, 5);
		Circulo c1 = new Circulo(p1, 10);
		System.out.println(c1);
		ponto p2 = new ponto(50, 70);
		Circulo c2 = new Circulo(p2, 10);
		System.out.println(c2);
		dist d = new dist(c1.centro, c1.getR(), c2.centro, c2.getR());
		System.out.println(d);
		quadrado q1 = new quadrado(p1, 5);
		System.out.println(q1);
		retangulo r1 = new retangulo(p1, 5, 10);
		System.out.println(r1);
	}

}
