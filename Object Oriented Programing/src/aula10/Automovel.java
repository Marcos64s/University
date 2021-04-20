package aula10;

public class Automovel extends Veiculo  {

	public Automovel(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
		
	}

	//SPECIAL METHODS
	
	@Override
	
	public String toString() {
		return super.toString() + "Automovel []";
	}	
}
