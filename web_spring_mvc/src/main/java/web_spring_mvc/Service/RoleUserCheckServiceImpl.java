package web_spring_mvc.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.RoleUserDao;
import web_spring_mvc.Dto.RoleUserDto;

@Service
public class RoleUserCheckServiceImpl implements IRoleUserCheckService{

	
	@Autowired
	private RoleUserDao roleUserDao = new RoleUserDao();
	
	// check amdin
	@Override
	public RoleUserDto GetDataRoleUser(Integer accountId) {
		return roleUserDao.GetDataRoleUser(accountId);
	}

}
