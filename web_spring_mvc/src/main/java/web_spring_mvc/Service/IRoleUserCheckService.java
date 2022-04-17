package web_spring_mvc.Service;

import org.springframework.stereotype.Service;

import web_spring_mvc.Dto.RoleUserDto;

@Service
public interface IRoleUserCheckService {
	
	// check amdin
	public RoleUserDto GetDataRoleUser(Integer accountId);
}
