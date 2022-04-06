package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.BannerEntity;
import web_spring_mvc.Entity.MenuEntity;
import web_spring_mvc.Entity.TypeProductEntity;


public interface IHomeService {
	
	public List<BannerEntity> GetDataBanner();
	public List<TypeProductEntity> getTypeProduct();
	public List<MenuEntity> GetDataMenus();
	public List<ProductDto> GetDataNewProduct();
	public List<ProductDto> GetDataHotProduct();
}
