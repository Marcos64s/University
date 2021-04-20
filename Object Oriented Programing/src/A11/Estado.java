package A11;

public class Estado extends Regiao {
	
	
	Localidade Localidade;

	public Estado(String nome, int populacao , Localidade Localidade) {
		super(nome, populacao);
		this.Localidade = Localidade;
	}

	public Localidade getCapital() {
		return this.Localidade;
	}
	
	


}
