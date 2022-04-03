package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.Banner;
import web_spring_mvc.Entity.Menu;
import web_spring_mvc.Entity.TypeProduct;


public interface IHomeService {
	
	public List<Banner> GetDataBanner();
	public List<TypeProduct> getTypeProduct();
	public List<Menu> GetDataMenus();
	public List<ProductDto> GetDataNewProduct();
	public List<ProductDto> GetDataHotProduct();
}
