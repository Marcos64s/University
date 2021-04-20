package A4;

public class Utilizador {
	public String nome;
	public String curso;
	public int Nmec;

	public Utilizador(String nome, int Nmec,String curso){
		this.nome = nome;
		this.Nmec = Nmec;
		this.curso = curso;

	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	public int getNmec() {
		return Nmec;
	}
	public void setNmec(int nmec) {
		Nmec = nmec;
	}
	public String toString() {
		return "Aluno: " + Nmec + "; " + nome +"; " + curso;
	}
}