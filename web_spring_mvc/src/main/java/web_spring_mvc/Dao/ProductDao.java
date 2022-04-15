package web_spring_mvc.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Dto.ProductDtoMapper;
import web_spring_mvc.Entity.ProductEntity;
import web_spring_mvc.Entity.UserEntity;

@Repository
public class ProductDao extends BaseDao {

	//USER
	
	// sql query
	private StringBuilder SqlString() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ");
		sql.append("p.id as productId, ");
		sql.append("p.name as productName, ");
		sql.append("p.typeId, ");
		sql.append("p.manufacturerId, ");
		sql.append("p.priceImport, ");
		sql.append("p.quantity, ");
		sql.append("p.dateAdded, ");
		sql.append("p.image, ");
		sql.append("p.decription, ");
		sql.append("p.sale, ");
		sql.append("p.warrantyPeriod, ");
		sql.append("p.price, ");
		sql.append("t.name as typeName, ");
		sql.append("m.name as manufacturerName ");
		sql.append("FROM ( ");
		sql.append("(product as p INNER JOIN typeproduct as t on p.typeId = t.id) ");
		sql.append("INNER JOIN manufacturer as m ON m.id = p.manufacturerId)");
		return sql;
	}

	// sql query
	private String SqlProduct(boolean newProduct, boolean hotProduct) {
		StringBuilder sql = SqlString();

		if (newProduct == true) {
			sql.append("WHERE p.newProduct = true ");
			sql.append("ORDER BY RAND() LIMIT 9 ");
		} else if (hotProduct == true) {
			sql.append("WHERE p.hotProduct = true ");
			sql.append("ORDER BY RAND() LIMIT 12 ");
		}

		return sql.toString();
	}

	// sql query
	private StringBuilder SqlProductByTypeId(int id) {

		StringBuilder sql = SqlString();
		sql.append("WHERE p.typeId = " + id);
		return sql;
	}

	// phan trang
	private String SqlProductPaginates(int id, int start, int totalPage) {

		StringBuilder sql = SqlProductByTypeId(id);
		sql.append(" LIMIT " + start + "," + totalPage);
		return sql.toString();
	}

	// list product new
	public List<ProductDto> GetDataNewProduct() {

		String sql = SqlProduct(true, false);
		List<ProductDto> list = _jdbcTemplate.query(sql, new ProductDtoMapper());
		return list;
	}

	// list product hot
	public List<ProductDto> GetDataHotProduct() {

		String sql = SqlProduct(false, true);
		List<ProductDto> list = _jdbcTemplate.query(sql, new ProductDtoMapper());
		return list;
	}

	// list product all by typeId
	public List<ProductDto> GetDataProductByTypeId(int id) {

		String sql = SqlProductByTypeId(id).toString();
		List<ProductDto> list = _jdbcTemplate.query(sql, new ProductDtoMapper());
		return list;
	}
	
	//find list product by typeId and paginate
	public List<ProductDto> GetDataProductPaginates(int id, int start, int totalPage) {

		String sql = SqlProductPaginates(id, start, totalPage);
		List<ProductDto> list = _jdbcTemplate.query(sql, new ProductDtoMapper());
		return list;
	}
	
	// sql query
	private StringBuilder SqlProductById(int id) {

		StringBuilder sql = SqlString();
		sql.append("WHERE p.id = " + id);
		return sql;
	}

	//find 1 product by id
	public ProductDto GetDataProductById(int id) {
		
		String sql = SqlProductById(id).toString();
		ProductDto product = _jdbcTemplate.queryForObject(sql, new ProductDtoMapper());
		return product;
	}
	
	//ADMIN
	// find all product
	public List<ProductDto> GetDataAllProduct() {
		
		return _jdbcTemplate.query(SqlString().toString(), new ProductDtoMapper());
	}
	
	//insert product
	public int AddProduct(ProductEntity product) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO product (");
		sql.append("name, ");
		sql.append("typeId, ");
		sql.append("manufacturerId, ");
		sql.append("priceImport, ");
		sql.append("quantity, ");
		sql.append("dateAdded, ");
		sql.append("image, ");
		sql.append("decription, ");
		sql.append("sale, ");
		sql.append("warrantyPeriod, ");
		sql.append("price, ");
		sql.append("newProduct, ");
		sql.append("hotProduct) ");
		sql.append("VALUES (");
		sql.append("'" + product.getProductName() +"', ");
		sql.append(product.getTypeId() +", ");
		sql.append(product.getManufacturerId() +", ");
		sql.append(product.getPriceImport() +", ");
		sql.append(product.getQuantity() +", ");
		sql.append("now(), ");
		sql.append("'" + product.getImage() +"', ");
		sql.append("'" + product.getDecription() +"', ");
		sql.append(product.getSale() +", ");
		sql.append("'" + product.getWarrantyPeriod() +"', ");
		sql.append(product.getPrice() +", ");
		sql.append(product.isNewProduct() +", ");
		sql.append(product.isHotProduct() +")");

		int insert = 0;
		try {
			insert = _jdbcTemplate.update(sql.toString());
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return insert;
	}

}
