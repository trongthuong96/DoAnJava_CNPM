package web_spring_mvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.MapperMenu;
import web_spring_mvc.Entity.Menu;

@Repository
public class MenuDao extends BaseDao{
	public List<Menu> GetDataMenus() {
		List<Menu> list = new ArrayList<Menu>();
		String sql = "SELECT * FROM menu";
		list = _jdbcTemplate.query(sql, new MapperMenu());
		return list;
	}
}
