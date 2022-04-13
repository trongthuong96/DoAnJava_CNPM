package web_spring_mvc.Dao;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Entity.MapperUser;
import web_spring_mvc.Entity.UserEntity;

@Repository
public class UserDao extends BaseDao{

	// ADD USER WHEN REGISTER
	public int AddAccount(UserEntity user) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO account (");
		sql.append("email, ");
		sql.append("password, ");
		sql.append("firstName, ");
		sql.append("lastName, ");
		sql.append("address, ");
		sql.append("village, ");
		sql.append("district, ");
		sql.append("city) ");
		sql.append("VALUES (");
		sql.append("'" + user.getEmail() +"', ");
		sql.append("'" + user.getPassword() +"', ");
		sql.append("'" + user.getFirstName() +"', ");
		sql.append("'" + user.getLastName() +"', ");
		sql.append("'" + user.getAddress() +"', ");
		sql.append("'" + user.getVillage() +"', ");
		sql.append("'" + user.getDistrict() +"', ");
		sql.append("'" + user.getCity() +"')");

		int insert = 0;
		try {
			insert = _jdbcTemplate.update(sql.toString());
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return insert;
	}
	
	// RETURN USER WHEN LOGIN
	public UserEntity GetUserByAcc(UserEntity user) {
		
		String sql = "SELECT * FROM account WHERE  email = '" + user.getEmail() + "'";
		try {
			UserEntity result = _jdbcTemplate.queryForObject(sql, new MapperUser());
			return result;
		}catch(Exception e) {
			return null;
		}		
	}
}
