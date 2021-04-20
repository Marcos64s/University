package aula06;

public class ponto {
	protected static int x;
	protected static int y;
	
	public ponto(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public static int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public static int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}
	
	public String toString() {
		return "("+x+","+y+")";
	}
	
}
