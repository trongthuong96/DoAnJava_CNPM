package web_spring_mvc.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.Service.User.AccountServiceImpl;

@Controller
public class UserController extends BaseController{
	
	@Autowired
	AccountServiceImpl accountService = new AccountServiceImpl();
	
	// LOGIN
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView Login() {
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.addObject("user", new UserEntity());
		_mvShare.setViewName("user/login");
		return _mvShare;
	}
	
	// check login
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.POST)
	public ModelAndView Login(HttpSession session, @ModelAttribute("user") UserEntity user, @RequestParam(required=false, name = "redirect") String redirect) {
		user = accountService.CheckAccount(user);
		if(user != null) {
			if(redirect != null && redirect.equals("thanh-toan"))
			{
				_mvShare.setViewName("redirect:/thanh-toan");
			} else {
				_mvShare.setViewName("redirect:/");
			}
			
			session.setAttribute("LoginInfo", user);
		} else {
			_mvShare.addObject("statusLogin", "Đăng nhập tài khoản thất bại");
		}
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		return _mvShare;
	}
	
	
	//REGISTER
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView Register() {
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.addObject("user", new UserEntity());
		_mvShare.setViewName("user/register");
		return _mvShare;
	}
	
	//check register
	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public ModelAndView CreateAccount(@ModelAttribute("user") UserEntity user) {
		int count = accountService.AddAccount(user);
		if(count > 0) {
			_mvShare.addObject("statusRegister", "Đăng ký tài khoản thành công");
		} else {
			_mvShare.addObject("statusRegister", "Đăng ký tài khoản thất bại");
		}
		return _mvShare;
	}
	
	//LOGOUT
		@RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
		public String Logout(HttpSession session, HttpServletRequest request) {
			
			session.removeAttribute("LoginInfo");
			return "redirect:"+request.getHeader("Referer");
		}
}
