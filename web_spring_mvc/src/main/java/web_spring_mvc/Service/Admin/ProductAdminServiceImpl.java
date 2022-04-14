package web_spring_mvc.Service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.ProductDao;
import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.ProductEntity;

@Service
public class ProductAdminServiceImpl implements IProductAdminService{

	
	@Autowired
	private ProductDao productDao;
	
	// find all product
	@Override
	public List<ProductDto> GetDataAllProduct() {
		
		return productDao.GetDataAllProduct();
	}

	// insert product
	@Override
	public int AddProduct(ProductEntity product) {
		return productDao.AddProduct(product);
	}

}
