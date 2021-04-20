package Aula0;

import A5.data;
import A5.pessoa;
	
public class professor extends pessoa{
	String investigacao;
	public professor(String nome, int cc, data dataNasc, String investigacao) {
		super(nome, cc, dataNasc);
		this.investigacao = investigacao;
	}

	public String getInvestigacao() {
		return investigacao;
	}



	public void setInvestigacao(String investigacao) {
		this.investigacao = investigacao;
	}



	@Override public String toString() {
		return "Professor: " + nome + " ; Area De Investigação: " + investigacao; 
	}
}
