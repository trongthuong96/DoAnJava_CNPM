package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperMenu implements RowMapper<Menu>{

	@Override
	public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
		Menu menu = new Menu();
		menu.setId(rs.getInt("id"));
		menu.setName(rs.getString("name"));
		menu.setUrl(rs.getString("url"));
		return menu;
	}

}
