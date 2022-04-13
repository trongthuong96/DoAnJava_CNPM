package web_spring_mvc.Dto;

public class Cart1Dto {

	private String cartId;
	private int productId;
	private int quantity;
	private long totalPrice;
	private ProductDto product;
	private long sumOfTotal;
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}	
	
	public ProductDto getProduct() {
		return product;
	}
	public void setProduct(ProductDto product) {
		this.product = product;
	}
	public long getSumOfTotal() {
		return sumOfTotal;
	}
	public void setSumOfTotal(long sumOfTotal) {
		this.sumOfTotal = sumOfTotal;
	}
}
