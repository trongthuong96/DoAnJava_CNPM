package web_spring_mvc.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RoleUserMapper implements RowMapper<RoleUserDto>{

	@Override
	public RoleUserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		RoleUserDto roleUser = new RoleUserDto();
		roleUser.setRoleId(rs.getInt("roleId"));
		roleUser.setRoleName(rs.getString("roleName"));
		roleUser.setAccountId(rs.getInt("accountId"));
		return roleUser;
	}

}
