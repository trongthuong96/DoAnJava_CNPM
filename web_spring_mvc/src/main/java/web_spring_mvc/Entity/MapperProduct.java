package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperProduct implements RowMapper<ProductEntity>{

	@Override
	public ProductEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductEntity product = new ProductEntity();
		product.setProductId(rs.getInt("productid"));
		product.setProductName(rs.getString("productName"));
		product.setTypeId(rs.getInt("typeId"));
		product.setManufacturerId(rs.getInt("manufacturerId"));
		product.setPriceImport(rs.getString("priceImport"));
		product.setQuantity(rs.getInt("quantity"));
		product.setDateAdded(rs.getDate("dateAdded"));
		product.setImage(rs.getString("image"));
		product.setDecription(rs.getString("decription"));
		product.setSale(rs.getInt("sale"));
		product.setWarrantyPeriod(rs.getString("warrantyPeriod"));
		product.setPrice(rs.getLong("price"));
		product.setNewProduct(rs.getBoolean("newProduct"));
		product.setHotProduct(rs.getBoolean("hotProduct"));
		return product;
	}

}
