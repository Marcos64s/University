package A5;

public class aluno extends pessoa{
	public static int mec = 100;
	protected data datains;
	
	public aluno (int cc, String nome , data dataNas, data datains) {
		super(nome, cc, dataNasc);
		this.mec = mec++;
		this.datains = datains;
		System.out.println("Aluno criado!");
	}
	
	public static int getMec() {
		return mec;
	}

	public static void setMec(int mec) {
		aluno.mec = mec;
	}

	public data getDatains() {
		return datains;
	}

	public void setDatains(data datains) {
		this.datains = datains;
	}

	@Override public String toString() {
		return "Aluno: " + nome + " ,Data de Nascimento: " + dataNasc +" ,Nmec: " + mec + " ,Data de Inscrição: " + datains;
	}
}
