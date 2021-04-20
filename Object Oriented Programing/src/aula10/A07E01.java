package aula10;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class A07E01 {
	
	public static void main(String[] args) {
		
		ArrayList<Veiculo> listaVeiculos = new ArrayList<Veiculo>();
		
		Veiculo a = new Automovel(2017, "red", "22-AA-22", 4, 1700, 300);
		System.out.println(a);
		Veiculo m = new Moto(2000, "black", "22-QP-92", 2, 125, 123);
		System.out.println(m);
		Veiculo b = new Bicicleta(2015, "blue", null, 2, 0, 90);
		System.out.println(b);
		
		listaVeiculos.add(a);
		listaVeiculos.add(m);
		listaVeiculos.add(b);
		
		Collections.sort(listaVeiculos, new Comparator<Veiculo>() {
	        @Override
	        public int compare(Veiculo v1, Veiculo v2)
	        {

	            return  v1.getAno() - v2.getAno();
	        }
	    });
		
		for(Veiculo v : listaVeiculos)
			System.out.println(v.toString());
	}
	
}
