package Aula07;

public class Automovel extends Veiculo  implements IMotorEletrico, IMotorCombustao, IMotorMisto{

	public Automovel(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
		
	}

	//SPECIAL METHODS
	
	@Override
	
	public String toString() {
		return super.toString() + "Automovel []";
	}

	@Override
	public double getEmissaoCO2() {
		
		return 0;
	}

	@Override
	public double getAutonomia() {

		return 0;
	}
	

	
}
