package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUser implements RowMapper<UserEntity>{

	@Override
	public UserEntity mapRow(ResultSet rs, int rowNum){
		UserEntity user = new UserEntity();
		try {
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
			user.setAddress(rs.getString("address"));
			user.setVillage(rs.getString("village"));
			user.setDistrict(rs.getString("district"));
			user.setCity(rs.getString("city"));
			user.setBirthday(rs.getDate("birthday"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
			user.setHide(rs.getBoolean("hide"));
		} catch(SQLException e) {
			return null;
		}
		
		return user;
	}

}
