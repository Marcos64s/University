package A07;

public class Circulo extends Figura {
	private double raio;
	
	public Circulo(Ponto centro, double raio){
		super(centro);
		this.raio = raio;
	}

	@Override
	public double area() {
		// TODO Auto-generated method stub
		return Math.PI * this.raio * this.raio;
	}

	@Override
	public double perimetro() {
		// TODO Auto-generated method stub
		return 2 * Math.PI * this.raio;
	}

	public double getRaio() {
		return raio;
	}

	public void setRaio(double raio) {
		this.raio = raio;
	}

	@Override
	public String toString() {
		return "Circulo [raio=" + raio + ", " + super.toString() + "]";
	}
	
}
