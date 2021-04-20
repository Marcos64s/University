package A11;

public class Automovel extends Veiculo implements Eletrico{

	private int potencia;
	private int autonomia;

	
	public Automovel(String matricula, int ano, int cor, int potencia) {
		super(matricula, ano, cor);
		this.potencia = potencia;
	}


	@Override
	public double getAutonomia() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
