package web_spring_mvc.Controller.Admin;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Entity.ProductEntity;
import web_spring_mvc.Service.IManuService;
import web_spring_mvc.Service.Admin.IProductAdminService;
import web_spring_mvc.Service.Admin.ITypeProductAdminService;

@Controller
public class ProductAdminController extends BaseAdminController {

	@Autowired
	private IProductAdminService productAdminService;

	@Autowired
	private ITypeProductAdminService typeProductAdminService;

	@Autowired
	private IManuService manuService;

	@RequestMapping(value = "/quan-tri/san-pham")
	public ModelAndView ProductAdmin(HttpSession session) {

		InitAdmin(session);

		_mvShareAdmin.addObject("listProduct", productAdminService.GetDataAllProduct());
		_mvShareAdmin.setViewName("admin/product/list-product");
		return _mvShareAdmin;
	}

	// add product
	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.GET)
	public ModelAndView AddProductAdmin(HttpSession session) {

		InitAdmin(session);

		_mvShareAdmin.addObject("manufacter", manuService.GetDataAllManufacturer());
		_mvShareAdmin.addObject("typeProduct", typeProductAdminService.GetTypeProduct());
		_mvShareAdmin.addObject("addAndUpdateProduct", new ProductEntity());
		_mvShareAdmin.setViewName("admin/product/add-edit-product");
		return _mvShareAdmin;
	}

	// add product
	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.POST)
	public ModelAndView AddProductAdmin(HttpSession session, HttpServletRequest request,
			
			@ModelAttribute("addAndUpdateProduct") ProductEntity product) {

		InitAdmin(session);

		productAdminService.AddProduct(product);
		_mvShareAdmin.setViewName("redirect:/them-san-pham");
		return _mvShareAdmin;
	}
}
