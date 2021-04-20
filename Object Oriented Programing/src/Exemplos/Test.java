package A07;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		ArrayList<Figura> lista = new ArrayList<>();

		lista.add(new Circulo(new Ponto(5, 5), 5));
		lista.add(new Retangulo(new Ponto(1, 1),5, 5));
		lista.add(new Quadrado(new Ponto(2, 2), 6));
		lista.add(new Retangulo(new Ponto(1, 1),4, 4));
		lista.add(new Quadrado(new Ponto(2, 2), 4));
		lista.add(new Circulo(new Ponto(1, 1), 1));
		
		for(Figura f: lista){
			System.out.println(f);
			System.out.println("area = " + f.area() + ", perimetro = " + f.perimetro());
			//((Desenhavel)f).desenha(); // erro
		}
		
		if(lista.get(2) instanceof Figura)
			System.out.println("o elemento dois é uma figura");
			
		if(lista.get(2) instanceof Retangulo)
			System.out.println("o elemento dois é uma retangulo");
		
		if(lista.get(2) instanceof Quadrado)
			System.out.println("o elemento dois é uma quadrado");
		
		ArrayList<Desenhavel> d = new ArrayList<>();
		for(Figura f: lista){
			if(f instanceof Desenhavel){
				d.add((Desenhavel)f);
			}
		}
		
		for(Desenhavel x : d){
			x.desenha();
		}
		
	}
}
