package web_spring_mvc.Controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Entity.UserEntity;

@Controller
public class BaseAdminController {
	
	public ModelAndView _mvShareAdmin = new ModelAndView();
	
	
	protected ModelAndView InitAdmin(HttpSession session) {
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		_mvShareAdmin.addObject("userAdmin", loginInfo);
		return _mvShareAdmin;
	}
	
}
