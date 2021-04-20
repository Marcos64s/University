package A4;

public class Livro {
	private int id = 100;
	private String titulo;
	private String tipo;
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo_emprestimo(String tipo) {
		this.tipo = tipo;
	}

	public Livro (String titulo, String tipo) {
		this.titulo = titulo;
		this.tipo = tipo;
		if (tipo == null)
			tipo = "Normal";
	}
	public Livro (String titulo) {
		this.titulo = titulo;
		this.tipo = "Normal";
		this.id = id++;
	}
	
	public String toString() {
		return "Livro " + id + ": " + titulo + ", " + tipo;
	}
}
