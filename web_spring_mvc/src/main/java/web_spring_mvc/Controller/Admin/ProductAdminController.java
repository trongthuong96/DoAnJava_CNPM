package web_spring_mvc.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//time
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuuMMddHHmmss");

	@RequestMapping(value = "/quan-tri/san-pham")
	public ModelAndView ProductAdmin(HttpSession session) {

		InitAdmin(session);

		_mvShareAdmin.addObject("listProduct", productAdminService.GetDataAllProduct());
		_mvShareAdmin.setViewName("admin/product/list-product");
		return _mvShareAdmin;
	}

	// add product
	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.GET)
	public ModelAndView AddProductAdmin(HttpSession session, @RequestParam(required=false, name = "message") String message) {

		InitAdmin(session);

		_mvShareAdmin.addObject("manufacter", manuService.GetDataAllManufacturer());
		_mvShareAdmin.addObject("typeProduct", typeProductAdminService.GetTypeProduct());
		_mvShareAdmin.addObject("addAndUpdateProduct", new ProductEntity());
		_mvShareAdmin.addObject("message", message);
		_mvShareAdmin.setViewName("admin/product/add-edit-product");
		return _mvShareAdmin;
	}

	// add product
	@RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.POST)
	public String AddProductAdmin(HttpSession session, HttpServletRequest request,
			@RequestParam("imageProduct") MultipartFile file,
			@ModelAttribute("addAndUpdateProduct") ProductEntity product) {
		
		InitAdmin(session);
		ServletContext context = request.getServletContext();
		
		//image
		if(file.isEmpty()) {
			return "redirect:/quan-tri/them-san-pham?message=chon-anh";
		} else {
			
			//time
			LocalDateTime now = LocalDateTime.now();
			
			product.setImage("product-"+dtf.format(now)+file.getOriginalFilename());
			int check = productAdminService.AddProduct(product);
			
			if(check != 0) {
				
				String path = context.getRealPath("/assets/img/product-" + dtf.format(now) + file.getOriginalFilename());
				try {
					file.transferTo(new File(path));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				return "redirect:/quan-tri/them-san-pham?message=Success";
			}else {
				return "redirect:/quan-tri/them-san-pham?message=Error";
			}
		}
	}
	
	// Edit product
	@RequestMapping(value = "/quan-tri/sua-san-pham/{productId}", method = RequestMethod.GET)
	public ModelAndView EditProductAdmin(HttpSession session, @PathVariable("productId") int productId, @RequestParam(required=false, name = "message") String message) {

		InitAdmin(session);
		
		_mvShareAdmin.addObject("manufacter", manuService.GetDataAllManufacturer());
		_mvShareAdmin.addObject("typeProduct", typeProductAdminService.GetTypeProduct());
		_mvShareAdmin.addObject("addAndUpdateProduct", productAdminService.GetDataProductById(productId));
		_mvShareAdmin.addObject("message", message);
		_mvShareAdmin.setViewName("admin/product/add-edit-product");
		return _mvShareAdmin;
	}
	
	// Edit product
	@RequestMapping(value = "/quan-tri/sua-san-pham/{productId}", method = RequestMethod.POST)
	public String EditProductAdmin(HttpSession session, HttpServletRequest request,
			 @PathVariable("productId") int productId,
			@RequestParam("imageProduct") MultipartFile file,
			@ModelAttribute("addAndUpdateProduct") ProductEntity product) {
		
		InitAdmin(session);
		
		//set id
		product.setProductId(productId);
		
		
		ServletContext context = request.getServletContext();
		int check = 0;
		
		//image
		if(file.isEmpty()) {
			check = productAdminService.UpdateProduct(product);
			
		} else {
			
			String imageDelete = product.getImage();
			
			//time
			LocalDateTime now = LocalDateTime.now();
			
			product.setImage("product-"+dtf.format(now)+file.getOriginalFilename());
			check = productAdminService.UpdateProduct(product);
			
			if(check != 0) {
				
				//delete image
				String path = context.getRealPath("/assets/img/"+ imageDelete);
				File fileToDelete = new File(path);
				fileToDelete.delete();
				
				path = context.getRealPath("/assets/img/product-"+ dtf.format(now) + file.getOriginalFilename());
				try {
					file.transferTo(new File(path));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(check != 0) {
			return "redirect:/quan-tri/sua-san-pham/"+productId+"?message=Success";
		} else {
			return "redirect:/quan-tri/sua-san-pham/"+productId+"?message=Error";
		}
	}
	
	// Delete product
	@RequestMapping(value = "/quan-tri/xoa-san-pham/{productId}")
	public String DeleteProductAdmin(HttpServletRequest request, @PathVariable("productId") int productId) {
		
		ServletContext context = request.getServletContext();
		int check = 0;
	
		// save image
		String imageDelete = productAdminService.GetDataProductById(productId).getImage();
		
		//delete product
		check = productAdminService.DeleteProduct(productId);
		
		if(check != 0) {
			
			//delete image
			String path = context.getRealPath("/assets/img/"+ imageDelete);
			File fileToDelete = new File(path);
			fileToDelete.delete();
		}
		
		
		if(check != 0) {
			return "redirect:/quan-tri/san-pham?message=Success";
		} else {
			return "redirect:/quan-tri/san-pham?message=Error";
		}
	}

}
