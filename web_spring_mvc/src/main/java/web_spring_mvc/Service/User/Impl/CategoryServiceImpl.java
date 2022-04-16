package web_spring_mvc.Service.User.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.ProductDao;
import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Service.User.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<ProductDto> GetAllProductsById(int id) {
		return productDao.GetDataProductByTypeId(id);
	}
	
	@Override
	public List<ProductDto> GetDateProductPaginates(int id, int start, int totalPage) {
		return productDao.GetDataProductPaginates(id, start, totalPage);
		
	}


}
