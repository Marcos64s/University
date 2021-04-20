package A5;

import java.time.LocalDateTime;
import java.time.Month;

public class A5E1 {
	public static void main(String[] args) {
		data d = new data(5, 10, 1988);
		data dins = new data(24,9,1999);
		
		pessoa p = new pessoa("Ana Santos", 98012244, d);
		System.out.println(p);
		
		aluno a1 = new aluno(98012244, "Ana", d,dins);
		System.out.println(a1);
		aluno.mec++;
		aluno a2 = new aluno(98012245, "Cristina", d, dins);
		System.out.println(a2);
		aluno.mec++;
		
		bolseiro a3 = new bolseiro ("Ana Santos", 98012244, new data(5,3,2018));
		System.out.println(a3);
		
		
		
		
		LocalDateTime ln = LocalDateTime.now();
			int dia = ln.getDayOfMonth();
			int mes = ln.getMonthValue();
			int ano = ln.getYear();
		
			
	}
}