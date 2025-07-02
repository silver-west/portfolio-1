package DB_point;

public class Cart {
	private String userId;
	private int itemNumber;
	private int orderCount;
	
	public Cart(String userId, int itemNumber, int orderCount) {
		super();
		this.userId = userId;
		this.itemNumber = itemNumber;
		this.orderCount = orderCount;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	
	
}

