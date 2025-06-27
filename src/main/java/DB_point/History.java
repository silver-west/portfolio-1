package DB_point;

public class History {
	private int number;
	private String id;
	private String coment;
	private int price;
	private String option;
	
	public History(int number, String id, String coment, int price, String option) {
		super();
		this.number = number;
		this.id = id;
		this.coment = coment;
		this.price = price;
		this.option = option;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	
	
}
