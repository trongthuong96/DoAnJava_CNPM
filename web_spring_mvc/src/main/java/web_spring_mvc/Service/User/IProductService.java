package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.ProductDto;

public interface IProductService {
	public ProductDto GetProductById (int id);
	
	public List<ProductDto> GetProductByTypeId (int id);
}
