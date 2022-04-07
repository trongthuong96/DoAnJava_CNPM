package web_spring_mvc.Service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.UserDao;
import web_spring_mvc.Entity.UserEntity;

@Service
public class AccountServiceImpl implements IAccountService{

	@Autowired
	UserDao userDao = new UserDao();
	
	public int AddAccount(UserEntity user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		
		return userDao.AddAccount(user);
	}

}
