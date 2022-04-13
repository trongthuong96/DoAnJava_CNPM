package web_spring_mvc.Controller.User;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web_spring_mvc.Dto.Cart1Dto;
import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.Service.User.Cart1ServiceImpl;
import web_spring_mvc.Service.User.CartServiceImpl;

@Controller
public class CartController extends BaseController{
	
	@Autowired
	private CartServiceImpl cartService = new CartServiceImpl();
	
	@Autowired
	private Cart1ServiceImpl cart1ServiceImpl;
	
	private List<Cart1Dto> list;
	 
	@RequestMapping(value = {"/gio-hang"})
	public ModelAndView Index(@CookieValue(name = "cartId", defaultValue = "notExist") String cartId) {
		
		list = cart1ServiceImpl.GetDataCartAll(cartId);
		_mvShare.addObject("CartData", list);
		_mvShare.addObject("TotalQuantity", cart1ServiceImpl.TotalQuantity(list));
		_mvShare.addObject("TotalPrice", cart1ServiceImpl.TotalPrice(list));
		_mvShare.addObject("banner", _homeService.GetDataBanner());
		_mvShare.setViewName("user/cart");
		return _mvShare;
	}
	
	@RequestMapping(value = "/them-gio-hang/{id}", method = RequestMethod.GET)
	public String AddCart(HttpServletRequest request,@CookieValue(name = "cartId", defaultValue = "notExist") String cartId,  @PathVariable String id, HttpServletResponse response) {
		
		if (cartId.equals("notExist")){
			UUID uuid = UUID.randomUUID();
			String cartIdChange = uuid.toString();
			// create a cookie
			Cookie cookie = new Cookie("cartId", cartId);
			
		    cookie.setMaxAge(7 * 24 * 60 * 60); // expires in 7 days
			
			cookie.setValue(cartIdChange);
			cart1ServiceImpl.AddProductCart(cartIdChange, id, "1");
			
			 cookie.setPath("/");

		    //add cookie to response
		    response.addCookie(cookie);
		} else {
			cart1ServiceImpl.AddProductCart(cartId, id, "1");
		}
		
		// redirect page
		return "redirect:" + request.getHeader("Referer");
	}
	
	
	  @RequestMapping(value = "/sua-gio-hang/{id}/{quantiy}") 
	  public String EditCart(HttpServletRequest request,@CookieValue(name = "cartId", defaultValue = "notExist") String cartId, @PathVariable String id, @PathVariable String quantiy, HttpServletResponse response) {
		  
		  if (cartId.equals("notExist")){
				UUID uuid = UUID.randomUUID();
				String cartIdChange = uuid.toString();
				// create a cookie
				Cookie cookie = new Cookie("cartId", cartId);
				
			    cookie.setMaxAge(7 * 24 * 60 * 60); // expires in 7 days
				
				cookie.setValue(cartIdChange);
				cart1ServiceImpl.AddProductCart(cartIdChange, id, quantiy);
				
				 cookie.setPath("/");

			    //add cookie to response
			    response.addCookie(cookie);
			} else {
				
				cart1ServiceImpl.AddProductCart(cartId, id, quantiy);	
			}
			
			// redirect 
			return "redirect:" + request.getHeader("Referer");
	  }
	
	@RequestMapping(value = "/xoa-gio-hang/{id}")
	public String DeleteCart(@CookieValue(name = "cartId", defaultValue = "notExist") String cartId, HttpServletRequest request, HttpSession session, @PathVariable int id) {
		
		cart1ServiceImpl.DeleteProductCart(cartId, id);
		
		// redirect 
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = {"thanh-toan"})
	public ModelAndView Checkout(HttpSession session, HttpServletResponse response) {
		
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		if(loginInfo == null) {
			 try {
				response.sendRedirect("/dang-nhap");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.setViewName("user/checkout");
		return _mvShare;
	}
	
	@RequestMapping(value = "/thanh-toan", method = RequestMethod.POST)
	public ModelAndView Checkout(HttpSession session, @ModelAttribute("Checkout") UserEntity userInfo) {
		
		
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		return _mvShare;
	}
}
