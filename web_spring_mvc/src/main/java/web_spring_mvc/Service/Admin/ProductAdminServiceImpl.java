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

	@Override
	public ProductEntity GetDataProductById(int id) {
		ProductDto product = productDao.GetDataProductById(id);
		
		ProductEntity productEntity = new ProductEntity();
		productEntity.setProductId(product.getProductId());
		productEntity.setProductName(product.getProductName());
		productEntity.setTypeId(product.getTypeId());
		productEntity.setManufacturerId(product.getManufacturerId());
		productEntity.setPriceImport(product.getPriceImport());
		productEntity.setQuantity(product.getQuantity());
		productEntity.setDateAdded(product.getDateAdded());
		productEntity.setImage(product.getImage());
		productEntity.setDecription(product.getDecription());
		productEntity.setSale(product.getSale());
		productEntity.setWarrantyPeriod(product.getWarrantyPeriod());
		productEntity.setPrice(product.getPrice());
		
		return productEntity;
	}

}
