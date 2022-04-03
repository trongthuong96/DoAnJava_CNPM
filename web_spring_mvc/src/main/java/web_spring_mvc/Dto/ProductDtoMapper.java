package web_spring_mvc.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductDtoMapper implements RowMapper<ProductDto>{

	@Override
	public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductDto products = new ProductDto();
		products.setProductId(rs.getInt("productId"));
		products.setProductName(rs.getString("productName"));
		products.setTypeId(rs.getInt("typeid"));
		products.setManufacturerId(rs.getInt("manufacturerId"));
		products.setPriceImport(rs.getString("priceImport"));
		products.setQuantity(rs.getInt("quantity"));
		products.setDateAdded(rs.getDate("dateAdded"));
		products.setImage(rs.getString("image"));
		products.setDecription(rs.getString("decription"));
		products.setSale(rs.getInt("sale"));
		products.setWarrantyPeriod(rs.getString("warrantyPeriod"));
		products.setPrice(rs.getLong("price"));
		products.setTypeName(rs.getString("typeName"));
		products.setManufacturerName(rs.getString("manufacturerName"));
		return products;
	}

}
