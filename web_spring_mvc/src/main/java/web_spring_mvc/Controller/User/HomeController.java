package web_spring_mvc.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Dao.BannerDao;
import web_spring_mvc.Service.User.HomeServiceImpl;

@Controller
public class HomeController {
	
	@Autowired
	HomeServiceImpl homeService;
	
	@RequestMapping(value = {"/","trang-chu"})
	public ModelAndView Index() {
		
		ModelAndView mv = new ModelAndView("user/index");
		mv.addObject("banner", homeService.GetDataBanner());
		mv.addObject("typeProduct", homeService.getTypeProduct());
		return mv;
	}
	
	@RequestMapping(value = {"san-pham"})
	public ModelAndView Product() {
		ModelAndView mv = new ModelAndView("user/product");
		return mv;
	}
}
