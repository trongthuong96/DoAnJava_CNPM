package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.ProductDto;

public interface ICategoryService {
	
	public List<ProductDto> GetAllProductsById(int id);
	public List<ProductDto> GetDateProductPaginates(int id, int start, int totalPage);
}
