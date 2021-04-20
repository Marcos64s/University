package A5;

public class Test {
	public static void main(String[] args) {
		aluno al = new aluno (9855678, "Andreia Melo",new data(18, 7, 1990), new data (1, 9, 2014));
		bolseiro bls = new bolseiro ("Igor Santos",8976543, new data(11, 5, 1985));
		bls.setBolsa(745);
		System.out.println("Aluno:" + al.getNome());
		System.out.println(al);
		System.out.println("Bolseiro:" + bls.getNome() + ", NMec: " + bls.getMec()+ ", Bolsa:" + bls.getBolsa());
		System.out.println(bls);
	}
}
