package Aula07;

public class DemoViatura extends Veiculo implements IDemo123 {

	public DemoViatura(int ano, String cor, String matricula, int numRodas, double cilindrada, double velMax) {
		super(ano, cor, matricula, numRodas, cilindrada, velMax);
	}

	@Override
	public int getMetodo1Demo1() {
		return 0;
	}

	@Override
	public int getMetodo2Demo1() {
		return 0;
	}

	@Override
	public int getMetodo1Demo2() {
		return 0;
	}

	@Override
	public int getMetodo2Demo2() {
		return 0;
	}

	@Override
	public int getMetodo1Demo3() {
		return 0;
	}

	@Override
	public int getMetodo2Demo3() {
		return 0;
	}

	@Override
	public int getMetodoDemo123() {
		return 0;
	}

}
