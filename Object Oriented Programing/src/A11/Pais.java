package A11;

import java.util.*;

public class Pais {

	
	private String nome;
	private Localidade capital;
	ArrayList<Regiao> regioes = new ArrayList<Regiao>();
	private int populacao;
	

	

	public Pais(String nome) {
		this.nome = nome;
		this.populacao = 0;
		this.capital =  new Localidade("*Indefinido*", 0 ,TipoLocalidade.Indefinido);
	}

	public Pais(String nome, Localidade Localidade) {
		this.nome = nome;
		this.populacao = 0;
		this.capital = Localidade;
	}

	public void addRegiao(Regiao estado) {
		regioes.add(estado);
		this.populacao += estado.getPopulacao();
	}

	
	public void removeRegiao(Regiao estado) {
		if (regioes.contains(estado))
			regioes.remove(estado);
		else
			System.out.println("Não contem essa região");
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "Pais: " + nome + ", populacao: " + populacao + " (capital: " + capital.getTipoLocalidade() +   
	capital.getNome() + ", população " + capital.getPopulacao() + ")";
	}

	
	
	
	
	
	
}
