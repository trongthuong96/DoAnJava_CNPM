package web_spring_mvc.Entity;

import java.sql.Date;

public class ProductEntity {
	private Integer productId;
	private String productName;
	private Integer typeId;
	private Integer manufacturerId;
	private Integer priceImport;
	private Integer quantity;
	private Date dateAdded;
	private String image;
	private String decription;
	private Integer sale;
	private String warrantyPeriod;
	private Long price;
	private boolean newProduct;
	private boolean hotProduct;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
	public Integer getPriceImport() {
		return priceImport;
	}
	public void setPriceImport(Integer priceImport) {
		this.priceImport = priceImport;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDecription() {
		return decription;
	}
	public void setDecription(String decription) {
		this.decription = decription;
	}
	public Integer getSale() {
		return sale;
	}
	public void setSale(Integer sale) {
		this.sale = sale;
	}
	public String getWarrantyPeriod() {
		return warrantyPeriod;
	}
	public void setWarrantyPeriod(String warrantyPeriod) {
		this.warrantyPeriod = warrantyPeriod;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public boolean isNewProduct() {
		return newProduct;
	}
	public void setNewProduct(boolean newProduct) {
		this.newProduct = newProduct;
	}
	public boolean isHotProduct() {
		return hotProduct;
	}
	public void setHotProduct(boolean hotProduct) {
		this.hotProduct = hotProduct;
	}
}
