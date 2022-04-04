package web_spring_mvc.Controller.User;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Service.User.HomeServiceImpl;
import web_spring_mvc.Service.User.IBannerService;

@Controller
public class BaseController {
	@Autowired
	HomeServiceImpl _homeService;
	
	@Autowired
	IBannerService _bannerService;
	
	public ModelAndView _mvShare = new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init() {
		_mvShare.addObject("menus", _homeService.GetDataMenus());
		_mvShare.addObject("typeProducts", _homeService.getTypeProduct());
		return _mvShare;
	}
}
