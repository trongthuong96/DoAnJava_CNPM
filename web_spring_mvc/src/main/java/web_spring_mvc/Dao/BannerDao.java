package web_spring_mvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.BannerEntity;
import web_spring_mvc.Entity.MapperBanner;

@Repository
public class BannerDao extends BaseDao{
	
	public List<BannerEntity> GetDataBanner() {
		List<BannerEntity> list = new ArrayList<BannerEntity>();
		String sql = "SELECT * FROM banner";
		list = _jdbcTemplate.query(sql, new MapperBanner());
		return list;
	}
}
