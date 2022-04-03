package web_spring_mvc.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Dto.PaginatesDto;
import web_spring_mvc.Service.User.ICategoryService;
import web_spring_mvc.Service.User.IPaginatesService;

@Controller
public class CategoryController extends BaseController{
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IPaginatesService paginatesService;
	
	private int totalProductPate = 2;
	
	@RequestMapping(value = {"san-pham/{id}"})
	public ModelAndView Product(@PathVariable String id) {
		
		int totalData = categoryService.GetAllProductsById(Integer.parseInt(id)).size();
		PaginatesDto paginatesInto = paginatesService.GetInfoPaginates(totalData, totalProductPate, 1);
		
		_mvShare.addObject("categoryId", id);
		_mvShare.addObject("paginatesInto", paginatesInto);
		_mvShare.addObject("ProductsPaginates", categoryService.GetDateProductPaginates(Integer.parseInt(id), paginatesInto.getStart(), totalProductPate));
		_mvShare.setViewName("user/category");
		return _mvShare;
	}
	
	@RequestMapping(value = {"san-pham/{id}/{currentPage}"})
	public ModelAndView Product(@PathVariable String id, @PathVariable String currentPage) {
		int totalData = categoryService.GetAllProductsById(Integer.parseInt(id)).size();
		PaginatesDto paginatesInto = paginatesService.GetInfoPaginates(totalData, totalProductPate, Integer.parseInt(currentPage));
		
		_mvShare.addObject("paginatesInto", paginatesInto);
		_mvShare.addObject("ProductsPaginates", categoryService.GetDateProductPaginates(Integer.parseInt(id), paginatesInto.getStart(), totalProductPate));
		_mvShare.setViewName("user/category");
		return _mvShare;
	}
}
