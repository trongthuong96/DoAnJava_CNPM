package web_spring_mvc.Service.Admin;

import java.util.List;

import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.ProductEntity;

public interface IProductAdminService {
	
	//get all product
	public List<ProductDto> GetDataAllProduct();
	
	//insert product
	public int AddProduct(ProductEntity product);
	
	//update product
	public int UpdateProduct(ProductEntity product);
	
	// find product
	public ProductEntity GetDataProductById(int id);
	
	//delete product
	public int DeleteProduct(int productId);
}
