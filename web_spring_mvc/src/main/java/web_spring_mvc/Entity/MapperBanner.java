package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBanner implements RowMapper<Banner>{

	@Override
	public Banner mapRow(ResultSet rs, int rowNum) throws SQLException {
		Banner banner = new Banner();
		banner.setId(rs.getInt("id"));
		banner.setImg(rs.getString("img"));
		banner.setCapption(rs.getString("capption"));
		banner.setContent(rs.getString("content"));
		
		return banner;
	}
	
}
