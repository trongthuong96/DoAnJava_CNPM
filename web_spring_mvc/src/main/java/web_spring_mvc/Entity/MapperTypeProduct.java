package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperTypeProduct implements RowMapper<TypeProduct> {

	@Override
	public TypeProduct mapRow(ResultSet rs, int rowNum) throws SQLException {
		TypeProduct typeProduct = new TypeProduct();
		typeProduct.setId(rs.getInt("id"));
		typeProduct.setName(rs.getString("name"));
		
		return typeProduct;
	}

}
