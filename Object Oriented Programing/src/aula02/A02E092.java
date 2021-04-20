package aula02;

public class A02E092 {
	public static void main( String[] args )
	{
	    String sample = "hello";
	    byte[] byteArray = sample.getBytes();
	    String convertedString = byteArray.toString();
	    System.out.println( convertedString );
	}
}
