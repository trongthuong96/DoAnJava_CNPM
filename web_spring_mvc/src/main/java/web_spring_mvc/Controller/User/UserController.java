package web_spring_mvc.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.Service.User.AccountServiceImpl;

@Controller
public class UserController extends BaseController{
	
	AccountServiceImpl accountService = new AccountServiceImpl();
	
	@RequestMapping(value = "/dang-nhap")
	public ModelAndView Login() {
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.setViewName("user/login");
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView Register() {
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.addObject("user", new UserEntity());
		_mvShare.setViewName("user/register");
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView CreateAccount(@ModelAttribute UserEntity user) {
		int count = accountService.AddAccount(user);
		if(count > 0) {
			_mvShare.addObject("status", "Đăng ký tài khoản thành công");
		} else {
			_mvShare.addObject("status", "Đăng ký tài khoản thất bại");
		}
		return _mvShare;
	}
}
