package a06;

public class A07E01 {

	public static void main(String[] args) { 
		Circulo c1 = new Circulo(2);        
		Circulo c2 = new Circulo(1, 3, 2);        
		
		Quadrado q1 = new Quadrado(2);        
		Quadrado q2 = new Quadrado(3, 4, 2);        
		
		Retangulo r1 = new Retangulo(2, 3);        
		Retangulo r2 = new Retangulo(3, 4, 2, 3);        
		
		ColecaoFiguras col = new ColecaoFiguras(42.0);// MaxArea     
		
		System.out.println(col.addFigura(c2));        
		System.out.println(col.addFigura(r1));        
		System.out.println(col.addFigura(r1));        
		System.out.println(col.addFigura(r2));        
		System.out.println(col.addFigura(c1));        
		System.out.println(col.addFigura(q2));        
		System.out.println(col.addFigura(q1));     
		System.out.println(col.delFigura(r1));        
		System.out.println(col.addFigura(q1));        
		
		System.out.println("\nArea Total: " + col.areaTotal());        
		
		System.out.println("\nLista de Figuras:");        
		for (Figura f: col.getFiguras())           
			System.out.println(f);
		
		System.out.println("\nCirculos na Lista de Figuras:");        
		for (Figura f: col.getFiguras())           
			if (f instanceof Circulo)        
				System.out.println(f);
		
		System.out.println("\nCentro das Figuras:");        
		for (Ponto p: col.getCentros())           
			System.out.println(p);     
	} 
} 