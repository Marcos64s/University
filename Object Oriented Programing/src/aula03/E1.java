package aula03;

import java.util.Scanner;
import java.lang.String;
import javax.swing.*;

public class E1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i;
		String s1i="",s2i="";


		System.out.println("String 1?");
		String s1 = sc.nextLine();
		System.out.println("String 2?");
		String s2 = sc.nextLine();
		System.out.println("A String 1 tem "+ s1.length() + " caracteres");
		System.out.println("A String 2 tem "+ s2.length() + " caracteres");
		if (s1.equals(s2) == false) {
			System.out.println("As Strings são diferentes");
		}
		else {			
			System.out.println("As Strings são iguais");
		}
		System.out.println("O ultimo caracter da String 1 é " + s1.charAt(s1.length() - 1));
		if (s2.charAt(s2.length() - 1) == '.')
			System.out.println("O '.' é o ultimo elemento de String 2");
		else
			System.out.println("O '.' não é o ultimo elemento de String 2");
		System.out.println("A String 1 em letras minusculas: " + s1.toLowerCase());
		System.out.println("A String 2 em letras minusculas: " + s2.toLowerCase());
		if (s2.equals(s2.toLowerCase()) == true)
			System.out.println("String 2 só tem letras minusculas");
		else
			System.out.println("String 2 não tem só letras minusculas");
		System.out.println("A String 1, sem espaço duplo: " + s1.replaceAll(" +", " "));

		System.out.println("As primeiras letras de cada palavra maiusculas: ");
		String[] words = s1.split("\\s");
		StringBuilder sb = new StringBuilder();
		String[] words1 = s2.split("\\s");
		StringBuilder sb1 = new StringBuilder();
		for(i = 0; i < words.length; i++){
			sb.append(words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase());
			sb.append(" ");
		}
		for(i = 0; i < words1.length; i++){
			sb1.append(words1[i].substring(0, 1).toUpperCase() + words1[i].substring(1).toLowerCase());
			sb1.append(" ");
		}
		System.out.print("String 1: " + sb.toString());
		System.out.println("String 2: " + sb1.toString());

		System.out.println("Palindromos?");
		
		for (i = s1.length(); i>0; i--)
			s1i = s1i + s1.charAt(i-1);
		for (i = s2.length(); i>0; i--)
			s2i = s2i + s1.charAt(i-1);
		
		if(s1i.equals(s1) == true)
			System.out.println("É palindromo");
		else
			System.out.println("Não é palindromo");
		
		if (s2i.equals(s2) == true)
			System.out.println("É palindromo");
		else
			System.out.println("Não é palindromo");
	
	
	
	sc.close();
	}
	
	
}
/*
	public static int countCharaters() {
	System.out.print(" ");
	return 1
	}
}
 */

