package A5;

import java.math.*;

public class dist {
	private static double r1;
	private static ponto centro1;
	private static double centro1x;
	private static double centro1y;
	private static double r2;
	private static double centro2x;
	private static double centro2y;
	private static ponto centro2;
	private static double inter;

	public dist (double centro1x ,double centro1y , double r1, double centro2x ,double centro2y, double r2){
		this.centro1x = centro1x;
		this.centro1y = centro1y;
		this.r1 = r1;	
		this.centro2x = centro2x;
		this.centro2y = centro2y;
		this.r2 = r2;
		this.inter = Math.sqrt(Math.pow(centro2x-centro1x,2)+Math.pow(centro2y-centro1y,2));
		
	}
	
	public dist (ponto centro1, double r1, ponto centro2, double r2){
		this.centro1 = centro1;
		this.r1 = r1;
		this.centro2 = centro2;
		this.r2 = r2;
		this.inter = Math.sqrt(Math.pow(centro2.getX()-centro1.getX(),2)+Math.pow(centro2.getY()-centro1.getY(),2));
	}
	
	public String toString() {
		if (inter <= r1+r2)
			return  "Interceção";
		else
			return "Não existe interceção";
		
	}
}	


