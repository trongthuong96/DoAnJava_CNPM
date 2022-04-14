package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperManufacturer implements RowMapper<ManufacturerEntity>{

	@Override
	public ManufacturerEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		ManufacturerEntity manufacturerEntity = new ManufacturerEntity();
		manufacturerEntity.setId(rs.getInt("id"));
		manufacturerEntity.setName(rs.getString("name"));
		manufacturerEntity.setLogo(rs.getString("logo"));
		return manufacturerEntity;
	}

}
