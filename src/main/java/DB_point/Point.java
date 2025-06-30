package DB_point;

public class Point {
	private int myPoint;
	private String id;
	
	public Point(int myPoint, String id) {
		super();
		this.myPoint = myPoint;
		this.id = id;
	}
	public int getMyPoint() {
		return myPoint;
	}
	public void setMyPoint(int myPoint) {
		this.myPoint = myPoint;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
