package Aula07;

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

	//GETTERS AND SETTERS
	
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

	@Override
	
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ano;
		long temp;
		temp = Double.doubleToLongBits(cilindrada);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((cor == null) ? 0 : cor.hashCode());
		result = prime * result + ((matricula == null) ? 0 : matricula.hashCode());
		result = prime * result + numRodas;
		temp = Double.doubleToLongBits(velMax);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Veiculo other = (Veiculo) obj;
		if (ano != other.ano)
			return false;
		if (Double.doubleToLongBits(cilindrada) != Double.doubleToLongBits(other.cilindrada))
			return false;
		if (cor == null) {
			if (other.cor != null)
				return false;
		} else if (!cor.equals(other.cor))
			return false;
		if (matricula == null) {
			if (other.matricula != null)
				return false;
		} else if (!matricula.equals(other.matricula))
			return false;
		if (numRodas != other.numRodas)
			return false;
		if (Double.doubleToLongBits(velMax) != Double.doubleToLongBits(other.velMax))
			return false;
		return true;
	}
	
}
