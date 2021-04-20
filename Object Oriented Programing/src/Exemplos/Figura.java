package A07;

public abstract class Figura {
	private Ponto centro;
	private String id;
	private static int count = 0;
	public Figura(Ponto centro) {
		this.centro = centro;
		this.id = "F" + count;
		count++;
	}
	
	@Override
	public String toString() {
		return "Figura [centro=" + centro + ", id=" + id + "]";
	}

	public Ponto getCentro() {
		return centro;
	}

	public void setCentro(Ponto centro) {
		this.centro = centro;
	}
	
	public abstract double area();
	
	public abstract double perimetro();
}
