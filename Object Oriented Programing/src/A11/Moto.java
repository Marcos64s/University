package A11;

public class Moto extends Veiculo implements Eletrico, Explosão{

	
	private int potencia;
	
	public Moto(String matricula, int ano, int cor, int potencia) {
		super(matricula, ano, cor);
		this.potencia = potencia;
	}

	@Override
	public double getEmissãoCO2() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public double getAutonomia() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
