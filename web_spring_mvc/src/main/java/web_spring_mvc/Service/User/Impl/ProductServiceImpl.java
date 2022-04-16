package web_spring_mvc.Service.User.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.ProductDao;
import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Service.User.IProductService;

@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	private ProductDao productDao;
	
	// tìm chi tiết sản phẩm theo id sản phẩm
	@Override
	public ProductDto GetProductById(int id) {
		return productDao.GetDataProductById(id);
	}

	// tìm sản phẩm theo id loại sp
	@Override
	public List<ProductDto> GetProductByTypeId(int id) {
		return productDao.GetDataProductByTypeId(id);
	}

}
