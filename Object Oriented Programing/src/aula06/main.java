package aula06;

public class main {

	public static void main(String[] args) {
		ponto p = new ponto(3,0);
		obj o = new obj(p);
		System.out.println(p+ "     " +o);
		obj i = new obj(15,20);
		System.out.println(p+ "     " +i);
	}

}
