package A07;

public class Ponto {
	private int x, y;

	public Ponto(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public Ponto() {
		this.x = 0;
		this.y = 0;
	}
	
	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Ponto [x=" + x + ", y=" + y + "]";
	}
	
	
}
