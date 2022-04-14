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
	
	@Override
	public int AddAccount(UserEntity user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		
		return userDao.AddAccount(user);
	}

	@Override
	public UserEntity CheckAccount(UserEntity user) {
		String pass = user.getPassword();
		user = userDao.GetUserByAcc(user);
		if (user != null) {
			if(BCrypt.checkpw(pass, user.getPassword())) {
				return user;
			}
			else {
				return null;
			}
		}
		return null;
	}

	@Override
	public int EditAccount(UserEntity user) {
		return userDao.EditAccount(user);
	}

}
