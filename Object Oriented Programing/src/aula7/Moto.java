package Aula07;

public class Moto extends Veiculo implements IMotorEletrico, IMotorCombustao {

	public Moto(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
		}

	//SPECIAL METHODS
	
	@Override
	
	public String toString() {
		return super.toString() + "Moto []";
	}

	@Override
	public double getEmissaoCO2() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public double getAutonomia() {
		// TODO Auto-generated method stub
		return 0;
	}

}
