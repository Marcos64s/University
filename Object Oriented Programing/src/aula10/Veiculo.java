package aula10;

public class Veiculo {
	
	private int ano;
	private String cor;
	private String matricula;
	private int numRodas;
	private double cilindrada;
	private double velMax;
	
	public Veiculo(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax){
		this.ano=ano;
		this.cor=cor;
		this.matricula=matricula;
		this.numRodas=numRodas;
		this.cilindrada = cilindrada;
		this.velMax = velMax;
	}
	
	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public int getNumRodas() {
		return numRodas;
	}

	public void setNumRodas(int numRodas) {
		this.numRodas = numRodas;
	}

	public double getCilindrada() {
		return cilindrada;
	}

	public void setCilindrada(double cilindrada) {
		this.cilindrada = cilindrada;
	}

	public double getVelMax() {
		return velMax;
	}

	public void setVelMax(double velMax) {
		this.velMax = velMax;
	}

	//SPECIAL METHODS
	
	@Override
	
	public String toString() {
		return "Veiculo [ano=" + ano + ", cor=" + cor + ", matricula=" + matricula + ", numRodas=" + numRodas
				+ ", cilindrada=" + cilindrada + ", velMax=" + velMax + "]";
		}	
}
