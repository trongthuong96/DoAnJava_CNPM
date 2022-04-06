package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBanner implements RowMapper<BannerEntity>{

	@Override
	public BannerEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		BannerEntity banner = new BannerEntity();
		banner.setId(rs.getInt("id"));
		banner.setImg(rs.getString("img"));
		banner.setCapption(rs.getString("capption"));
		banner.setContent(rs.getString("content"));
		
		return banner;
	}
	
}
