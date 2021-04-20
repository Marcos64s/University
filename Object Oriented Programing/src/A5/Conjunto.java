package A5;

public class Conjunto {
	private int i = 2;
	private	int a[];
	private int c = 0;
	
	void insert (int i) {
		for (c = 0; c<a.length;c++)
			if (i == a[c])
				System.out.println("O Numero já se encontra no conjunto");
			else
				a[-1]=i;
				System.out.println("O Numero foi adicionado");
	}

}
