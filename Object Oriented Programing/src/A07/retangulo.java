package A4;

public class retangulo {
	private double lado1;
	private double lado2;
	private ponto centro;
	private String cor;
	private double area;
	
	public retangulo( ponto centro, double lado1, double lado2){
		this.lado1 = lado1;
		this.lado2 = lado2;
		this.centro= centro;
		this.cor="Vermelho";
		this.area= lado1 * lado2;
	}
	public String toString(){
		return "Retangulo: " + centro + " ; "+lado1+ "x" + lado2+ " ; " + cor+ " ; Area: " + area;
	}
	public double getLado1() {
		return lado1;
	}
	public void setLado1(double lado1) {
		this.lado1 = lado1;
	}
	public double getLado2() {
		return lado2;
	}
	public void setLado2(double lado2) {
		this.lado2 = lado2;
	}
	public ponto getCentro() {
		return centro;
	}
	public void setCentro(ponto centro) {
		this.centro = centro;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
}
