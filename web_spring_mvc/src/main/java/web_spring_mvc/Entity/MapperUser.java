package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUser implements RowMapper<UserEntity>{

	@Override
	public UserEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserEntity user = new UserEntity();
		user.setId(rs.getInt("id"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setFullName(rs.getString("fullName"));
		user.setAddress(rs.getString("address"));
		user.setBirthday(rs.getDate("birthday"));
		user.setPhoneNumber(rs.getString("phoneNumber"));
		user.setHide(rs.getBoolean("hide"));
		return user;
	}

}
