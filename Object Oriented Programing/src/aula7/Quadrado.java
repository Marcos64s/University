package aula07;

import A4.ponto;

public class Quadrado {
	private double lado;
	private  ponto centro;
	private String cor;
	private double area;

	public Quadrado(ponto centro, double lado){
		this.lado = lado;
		this.centro = centro;
		this.cor = "Vermelho";
		this.area = lado*lado;
	}

	public Quadrado(double lado){
		this.lado = lado;
		this.centro = new ponto(0,0);
		this.cor = "Vermelho";
		this.area = lado*lado;

	}
	public Quadrado(int i, int j, int k) {
		// TODO Auto-generated constructor stub
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
	public String toString(){
		return "Quadrado: " + centro + " ; " + lado + " ; " + cor + " ; Area: " + area;
	}
}
