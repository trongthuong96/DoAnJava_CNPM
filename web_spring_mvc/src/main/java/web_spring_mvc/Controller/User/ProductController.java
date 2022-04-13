package web_spring_mvc.Controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Entity.CartEntity;
import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.Service.User.IProductService;

@Controller
public class ProductController extends BaseController{
	
	@Autowired
	private IProductService _productService;
	
	@RequestMapping(value = {"/chi-tiet/{id}"})
	public ModelAndView Product(@PathVariable int id) {
		_mvShare.setViewName("user/product");
		
		_mvShare.addObject("cart", new CartEntity());
		
		// detail
		_mvShare.addObject("product", _productService.GetProductById(id));

		// lay san pham theo id the loai
		_mvShare.addObject("productByTypeId", _productService.GetProductByTypeId(_productService.GetProductById(id).getTypeId()));
		return _mvShare;
	}
}
