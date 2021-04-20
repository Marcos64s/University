package A5;

public class ponto {
	private double x,y;	
	public ponto(double x, double y){
		this.x = x;
		this.y = y;
	}
	public ponto(){
		this.x = 0;
		this.y = 0;
	}
	public String toString (){
		return ("("+x+","+y+")");
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
}
