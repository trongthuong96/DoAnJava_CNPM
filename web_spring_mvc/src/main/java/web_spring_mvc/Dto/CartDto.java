package web_spring_mvc.Dto;

public class CartDto {
	private int quantity;
	private double totalPrice;
	private ProductDto product;
	
	//constructor
	public CartDto() {
	}
	
	public CartDto(int quantity, double totalPrice, ProductDto product) {
		super();
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.product = product;
	}

	// get set
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public ProductDto getProduct() {
		return product;
	}

	public void setProduct(ProductDto product) {
		this.product = product;
	}
}
