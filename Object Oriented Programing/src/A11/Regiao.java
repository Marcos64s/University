package A11;

public class Regiao {

	private String nome;
	private int populacao;
	
	
	public Regiao(String nome, int populacao) {
		this.setNome(nome);
		this.populacao = populacao;
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
	
	
}
