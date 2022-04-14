package web_spring_mvc.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.ManufacturerEntity;
import web_spring_mvc.Entity.MapperManufacturer;

@Repository
public class ManufacturerDao extends BaseDao{
	
	private String SqlString() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM manufacturer");
		return sql.toString();
	}
	
	public List<ManufacturerEntity> GetDataAllManufacturer(){
		try {
			return _jdbcTemplate.query(SqlString(), new MapperManufacturer());
		} catch (Exception e) {
			return null;
		}
	}
}
