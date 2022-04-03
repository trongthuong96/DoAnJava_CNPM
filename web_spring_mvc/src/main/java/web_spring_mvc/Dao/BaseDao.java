package web_spring_mvc.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

public class BaseDao {
	@Autowired
	protected JdbcTemplate _jdbcTemplate;
}
