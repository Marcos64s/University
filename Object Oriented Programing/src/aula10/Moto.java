package aula10;

public class Moto extends Veiculo{

	public Moto(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
		}
	@Override
	public String toString() {
		return super.toString() + "Moto []";
	}
}
