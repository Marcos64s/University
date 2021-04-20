package A07;

public class Retangulo extends Figura implements Desenhavel{
	private double c, a;
	
	public Retangulo(Ponto centro, double c, double a){
		super(centro);
		this.a = a;
		this.c = c;
	}

	@Override
	public double area() {
		// TODO Auto-generated method stub
		return this.c * this.a;
	}

	@Override
	public double perimetro() {
		// TODO Auto-generated method stub
		return 2 * this.c + 2 * this.a;
	}

	public double getC() {
		return c;
	}

	public void setC(double c) {
		this.c = c;
	}

	public double getA() {
		return a;
	}

	public void setA(double a) {
		this.a = a;
	}

	@Override
	public String toString() {
		return "Retangulo [c=" + c + ", a=" + a + ", " + super.toString() + "]";
	}

	@Override
	public void desenha() {
		// TODO Auto-generated method stub
		for(int i = 0 ; i < this.c ; i++)
			System.out.print(Desenhavel.simbolo);

		System.out.println();
		for(int j = 2 ; j < this.a ; j++){
			System.out.print(Desenhavel.simbolo);
			for(int i = 2 ; i < this.c ; i++)
				System.out.print(" ");
			System.out.print(Desenhavel.simbolo);
			System.out.println();
		}

		for(int i = 0 ; i < this.c ; i++)
			System.out.print(Desenhavel.simbolo);
		
		System.out.println();
	}
}
