package web_spring_mvc.Entity.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import web_spring_mvc.Entity.TypeProductEntity;

public class MapperTypeProduct implements RowMapper<TypeProductEntity> {

	@Override
	public TypeProductEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		TypeProductEntity typeProduct = new TypeProductEntity();
		typeProduct.setId(rs.getInt("id"));
		typeProduct.setName(rs.getString("name"));
		
		return typeProduct;
	}

}
