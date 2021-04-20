package Aula0;

import A5.aluno;
import A5.data;

public class posgrad extends aluno{
	private professor orientador;
	
	public posgrad(int cc, String nome, data dataNasc, data datains, professor orientador) {
		super(cc, nome, dataNasc, datains);
		this.cc = cc;
		this.nome = nome;
		this.dataNasc = dataNasc;
		this.datains = datains;
		this.orientador = orientador;
		
	}
	
	@Override public String toString() {
		return "Nome: " + nome + " ;Número Mec: "+ aluno.getMec() + " ; Professor Orientador: "+ orientador.getNome();
	}
}
