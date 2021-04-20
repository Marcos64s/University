package aula10;

public class Bicicleta extends Veiculo {

	public Bicicleta(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
		
	}

	//SPECIAL METHODS
	
	@Override
	
	public String toString() {
		return super.toString() + "Bicicleta []";
	}

}
