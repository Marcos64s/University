package A11;

public class Localidade {
	
	
	TipoLocalidade TipoLocalidade;
	private String nome;
	private int populacao;
	
	public Localidade (String nome, int populacao , TipoLocalidade TipoLocalidade) {
		this.nome = nome;
		this.populacao = populacao;
		this.TipoLocalidade = TipoLocalidade;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getPopulacao() {
		return populacao;
	}

	public void setPopulacao(int populacao) {
		this.populacao = populacao;
	}

	public TipoLocalidade getTipoLocalidade() {
		return TipoLocalidade;
	}

	public void setTipoLocalidade(TipoLocalidade tipoLocalidade) {
		TipoLocalidade = tipoLocalidade;
	}

	
	
	
	
}
