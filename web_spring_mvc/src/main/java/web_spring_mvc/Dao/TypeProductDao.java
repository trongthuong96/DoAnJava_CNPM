package web_spring_mvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.TypeProductEntity;
import web_spring_mvc.Entity.Mapper.MapperTypeProduct;

@Repository
public class TypeProductDao extends BaseDao{
	
	public List<TypeProductEntity> GetTypeProduct() {
		List<TypeProductEntity> list = new ArrayList<TypeProductEntity>();
		String sql = "SELECT * FROM typeproduct";
		list = _jdbcTemplate.query(sql, new MapperTypeProduct());
		return list;
	}
}
