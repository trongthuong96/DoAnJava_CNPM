package web_spring_mvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.MapperMenu;
import web_spring_mvc.Entity.MenuEntity;

@Repository
public class MenuDao extends BaseDao{
	public List<MenuEntity> GetDataMenus() {
		List<MenuEntity> list = new ArrayList<MenuEntity>();
		String sql = "SELECT * FROM menu";
		list = _jdbcTemplate.query(sql, new MapperMenu());
		return list;
	}
}
