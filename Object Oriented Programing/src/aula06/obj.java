package aula06;

public class obj extends ponto{
	private static ponto pos;
	private int newx;
	private int newy;
	
	
	public obj(ponto pos) {
		super(x,y);
		this.pos=pos;
	}

	public obj(int newx,int newy) {
		super(x,y);
		newx = x + newx;
		newy = y + newy;
	}
	
	public String toString() {
		return "O objeto moveu se para: (" +newx+","+newy+")";
	}
}