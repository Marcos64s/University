package A11;

public class Moto extends Veiculo implements Eletrico, Explos�o{

	
	private int potencia;
	
	public Moto(String matricula, int ano, int cor, int potencia) {
		super(matricula, ano, cor);
		this.potencia = potencia;
	}

	@Override
	public double getEmiss�oCO2() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public double getAutonomia() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
