package DB_point;

public class MyCart extends Cart {
	private String itemName;
	private String coment;
	private int itemTotal;
	private int itemPrice;
	
	public MyCart(String userId, int itemNumber, int orderCount, String itemName, String coment, int itemTotal, int itemPrice) {
		super(userId, itemNumber, orderCount);
		this.itemName = itemName;
		this.coment = coment;
		this.itemTotal = itemTotal;
		this.itemPrice = itemPrice;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public int getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	
	
	
}
