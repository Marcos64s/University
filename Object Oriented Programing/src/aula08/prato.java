package aula08;


public class prato {
	protected static String tipo;
	protected static String variedade;
	protected static double proteinas;
	protected static double calorias;
	protected static double peso;		

	prato(String variedade, double proteinas, double calorias, double peso) {
		this.variedade = variedade;
		this.proteinas = proteinas;
		this.calorias = calorias;
		this.peso = peso;
	}
}