package A5;

public class bolseiro extends aluno{
	private int bolsa = 0;
	
	
	public bolseiro( String nome,int cc, data dataNasc) {
		super(cc, nome, dataNasc, dataNasc);
		this.bolsa = bolsa;
	}
		
	public int getBolsa() {
		return bolsa;
	}



	public void setBolsa(int bolsa) {
		this.bolsa = bolsa;
	}



	@Override public String toString() {
		return nome + ", CC: " + cc + " Data: " + dataNasc;
	}

}
