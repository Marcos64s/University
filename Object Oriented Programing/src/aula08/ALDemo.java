package aula08;

import java.util.ArrayList;
import java.util.List;

public class ALDemo {
	public static void main(String[] args) {
		List<Integer> c1 = new ArrayList<>();
		for (int i = 10; i <= 100; i+=10)
			c1.add(i);
		System.out.println("Size: " + c1.size());
		for (int i = 0; i < c1.size(); i++)
			System.out.println("Elemento: " + c1.get(i));
		List<String> c2 = new ArrayList<>();
		c2.add("Chuva");
		c2.add("Frio");
		c2.add("Vento");
		System.out.println("Size: " + c2.size());
		for (int i = 0; i < c2.size(); i++)
			System.out.println("Elemento: " + c2.get(i));
		c2.remove(0);
		c2.remove(0);
		for (int i = 0; i < c2.size(); i++)
			System.out.println("Elemento: " + c2.get(i));
	}
}