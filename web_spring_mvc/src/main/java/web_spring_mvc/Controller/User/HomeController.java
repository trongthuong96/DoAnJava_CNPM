package web_spring_mvc.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController{
	
	@RequestMapping(value = {"/","/trang-chu/"})
	public ModelAndView Index() {
		
		_mvShare.addObject("newProduct", _homeService.GetDataNewProduct());
		_mvShare.addObject("hotProduct", _homeService.GetDataHotProduct());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}
}
