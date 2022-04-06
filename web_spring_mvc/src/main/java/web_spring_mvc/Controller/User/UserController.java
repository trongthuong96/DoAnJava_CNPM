package web_spring_mvc.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController extends BaseController{
	@RequestMapping(value = "/dang-nhap")
	public ModelAndView Login() {
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.setViewName("user/login");
		return _mvShare;
	}
	
	@RequestMapping(value = "/dang-ky")
	public ModelAndView Register() {
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.setViewName("user/register");
		return _mvShare;
	}
}
