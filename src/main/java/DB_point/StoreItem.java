package DB_point;

public class StoreItem {
	private int number;
	private String name;
	private int price;
	private String coment;
	private int total;
	private String path;
	
	public StoreItem(int number, String name, int price, String coment, int total, String path) {
		super();
		this.number = number;
		this.name = name;
		this.price = price;
		this.coment = coment;
		this.total = total;
		this.path = path;
	}
	
	public StoreItem(int number, String name, int price, String coment, int total) {
		super();
		this.number = number;
		this.name = name;
		this.price = price;
		this.coment = coment;
		this.total = total;
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
}
