package A5;

public class quadrado extends retangulo {
	private double lado;
	private  ponto centro;
	private String cor;
	private double area;
	
	public quadrado(ponto centro, double lado){
		super (centro, lado, lado);
		this.lado = lado;
		this.centro = centro;
		this.cor = "Vermelho";
		this.area = lado*lado;
		
	}
	public double getLado() {
		return lado;
	}
	public void setLado(double lado) {
		this.lado = lado;
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
	@Override public String toString(){
		return "Quadrado: " + centro + " ; " + lado + " ; " + cor + " ; Area: " + area;
	}
}
