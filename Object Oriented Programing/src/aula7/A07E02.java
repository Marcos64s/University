package Aula07;

public class A07E02 {

	public static void main(String[] args) {
		IDemo123 id123 = new DemoViatura(2017,"red", "99-AA-99", 4, 1700, 270);
		metodo1(id123);
		metodo2(id123);
		metodo3(id123);
		metodo4(id123);
	}

	
	public static void metodo1(IDemo1 demo1) {
		demo1.getMetodo1Demo1();
		demo1.getMetodo2Demo1();
	}
	
	public static void metodo2(IDemo2 demo2) {
		demo2.getMetodo1Demo2();
		demo2.getMetodo2Demo2();
	}
	
	public static void metodo3(IDemo3 demo3) {
		demo3.getMetodo1Demo3();
		demo3.getMetodo2Demo3();
	}
	
	public static void metodo4(IDemo123 demo123) {
		demo123.getMetodo1Demo1();
		demo123.getMetodo2Demo1();
		demo123.getMetodo1Demo2();
		demo123.getMetodo2Demo2();
		demo123.getMetodo1Demo3();
		demo123.getMetodo2Demo3();
		demo123.getMetodoDemo123();
	}
}
