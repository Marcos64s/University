package A4;

public class Circulo {
	private double r;
	public  ponto centro;
	private String cor;
	private double area;
	
	public double getR() {
		return r;
	}

	public void setR(double r) {
		this.r = r;
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


	public Circulo (double x, double y, double r){
		this.centro = new ponto(x,y);
		this.r = r;
	}

	public Circulo(ponto x, double r){
		this.centro = x;
		this.r = r;
		this.cor = "Preto";
		this.area = Math.PI*r*r;
		
	}
	public String toString(){
		return "Circulo: "+centro+" ; " + r + " ;  "+cor + " ; Area: " + area ;
	}

}

