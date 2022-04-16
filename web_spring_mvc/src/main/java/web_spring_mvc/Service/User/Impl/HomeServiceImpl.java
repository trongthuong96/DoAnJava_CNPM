package web_spring_mvc.Service.User.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.BannerDao;
import web_spring_mvc.Dao.MenuDao;
import web_spring_mvc.Dao.ProductDao;
import web_spring_mvc.Dao.TypeProductDao;
import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.BannerEntity;
import web_spring_mvc.Entity.MenuEntity;
import web_spring_mvc.Entity.TypeProductEntity;
import web_spring_mvc.Service.User.IHomeService;

@Service
public class HomeServiceImpl implements IHomeService{
	
	@Autowired
	private BannerDao bannerDao;
	
	@Autowired
	private TypeProductDao typeProductDao;
	
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<BannerEntity> GetDataBanner() {
		return bannerDao.GetDataBanner();
	}

	@Override
	public List<TypeProductEntity> getTypeProduct() {
		return typeProductDao.GetTypeProduct();
	}

	@Override
	public List<MenuEntity> GetDataMenus() {
		return menuDao.GetDataMenus();
	}

	@Override
	public List<ProductDto> GetDataNewProduct() {
		List<ProductDto> list = productDao.GetDataNewProduct();
		return list;
	}

	@Override
	public List<ProductDto> GetDataHotProduct() {
		List<ProductDto> list = productDao.GetDataHotProduct();
		return list;
	}
	
	
	
}
