package web_spring_mvc.Controller.Admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeAdminController extends BaseAdminController {
	
	@RequestMapping(value="/quan-tri")
	public ModelAndView IndexAdmin(HttpSession session) {
		
		InitAdmin(session);
		_mvShareAdmin.setViewName("admin/index");
		return _mvShareAdmin;
	}
}
