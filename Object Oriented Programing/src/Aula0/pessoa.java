package Aula0;


public class pessoa {
	String nome;
	int cc;
	static data dataNasc;
		
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}

	public data getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(data dataNasc) {
		this.dataNasc = dataNasc;
	}

	public pessoa(String nome, int cc, data dataNasc) {
		this.nome = nome;
		this.cc = cc;
		this.dataNasc = dataNasc;
	}
	
	@Override public String toString() {
		return nome + ", CC: " + cc + " Data: "+ dataNasc;
	}
}
