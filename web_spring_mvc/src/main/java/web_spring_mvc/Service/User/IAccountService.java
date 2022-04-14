package web_spring_mvc.Service.User;

import web_spring_mvc.Entity.UserEntity;

public interface IAccountService {
	public int AddAccount(UserEntity user);
	public UserEntity CheckAccount(UserEntity user);
	public int EditAccount(UserEntity user);
}
