package A11;

import java.io.*;
import java.util.*;

public class A11E01 {

	public static void main(String[] args) throws IOException {
		
		Scanner input = new Scanner(new FileReader("v.csv"));		
		
		while (input.hasNext()) {
			String word = input.next();
			System.out.println(word);
		}
	}
	
}