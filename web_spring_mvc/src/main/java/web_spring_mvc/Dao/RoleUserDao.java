package web_spring_mvc.Dao;

import org.springframework.stereotype.Repository;

import web_spring_mvc.Dto.RoleUserDto;
import web_spring_mvc.Dto.RoleUserMapper;

@Repository
public class RoleUserDao extends BaseDao{

	// sql query
	public StringBuilder SqlString() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT r.id as roleId, r.name as roleName, a.accountId  FROM role r, accountrole a WHERE r.id = a.roleId");
		return sql;
	}
	
	//check admin
	public RoleUserDto GetDataRoleUser(Integer accountId){
		StringBuilder sql = SqlString();
		sql.append(" AND a.accountId = " + accountId);
		sql.append(" AND r.name = 'admin'");
		
		try {
			return _jdbcTemplate.queryForObject(sql.toString(), new RoleUserMapper());
		}catch(Exception e) {
			return null;
		}
		
	}
}
