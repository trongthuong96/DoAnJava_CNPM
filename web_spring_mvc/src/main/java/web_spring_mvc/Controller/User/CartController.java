package web_spring_mvc.Controller.User;

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
import web_spring_mvc.Service.User.IAccountService;
import web_spring_mvc.Service.User.ICheckoutService;
import web_spring_mvc.Service.User.Impl.Cart1ServiceImpl;

@Controller
public class CartController extends BaseController{
	
	@Autowired
	private Cart1ServiceImpl cart1ServiceImpl;
	
	@Autowired
	private IAccountService accountService;
	
	@Autowired
	private ICheckoutService checkoutService;
	
	private List<Cart1Dto> list;
	 
	//CART SHOP
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
	
	// ADD PRODUCT CART SHOP
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
	
	
	// EDIT QUANTIY PRODUCT CART SHOP
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
	
	  // DELETE PRODCUT CART SHOP
	@RequestMapping(value = "/xoa-gio-hang/{id}")
	public String DeleteCart(@CookieValue(name = "cartId", defaultValue = "notExist") String cartId, HttpServletRequest request, HttpSession session, @PathVariable int id) {
		
		cart1ServiceImpl.DeleteProductCart(cartId, id);
		
		// redirect 
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = {"/thanh-toan"})
	public ModelAndView Checkout(HttpSession session) {
		
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		_mvShare.addObject("userUdate", loginInfo);
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		_mvShare.setViewName("user/checkout/checkout");
		return _mvShare;
	}
	
	// CHECK INFO USER PAY
	@RequestMapping(value = "/thanh-toan", method = RequestMethod.POST)
	public ModelAndView Checkout(@ModelAttribute("userUdate") UserEntity user, HttpSession session, @ModelAttribute("Checkout") UserEntity userInfo) {
		
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		user.setId(loginInfo.getId());
		user.setPassword(loginInfo.getPassword());
		if(accountService.EditAccount(user)!=0) {
			session.setAttribute("LoginInfo", user);
			_mvShare.setViewName("redirect:/thanh-toan-pay");
		} else {
			_mvShare.setViewName("redirect:/thanh-toan");
		}
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		return _mvShare;
	}
	
	//PAY PAY
	@RequestMapping(value = {"/thanh-toan-pay"})
	public ModelAndView CheckoutPay(@CookieValue(name = "cartId", defaultValue = "notExist") String cartId, HttpSession session) {
		
		list = cart1ServiceImpl.GetDataCartAll(cartId);
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		_mvShare.addObject("userUdate", loginInfo);
		_mvShare.addObject("banners", _bannerService.GetDataBanner());
		
		_mvShare.addObject("CartData", list);
		_mvShare.addObject("TotalQuantity", cart1ServiceImpl.TotalQuantity(list));
		_mvShare.addObject("TotalPrice", cart1ServiceImpl.TotalPrice(list));
		_mvShare.setViewName("user/checkout/checkout_pay");
		return _mvShare;
	}
	
	// pay in invoice
	@RequestMapping(value = {"/thanh-toan-pay"}, method = RequestMethod.POST)
	public String CheckoutPayPay(@CookieValue(name = "cartId", defaultValue = "notExist") String cartId, HttpSession session, HttpServletRequest request) {
		
		list = cart1ServiceImpl.GetDataCartAll(cartId);
		UserEntity loginInfo = (UserEntity)session.getAttribute("LoginInfo");
		
		// add invoice
		if(checkoutService.InserInvoice_InvoiceDetail(loginInfo.getId(), list) != 0){
			// delete on product in cart
			cart1ServiceImpl.DeleteAllProductCart(cartId);
			return "redirect:/";
		}
		
		
		return "redirect:" + request.getHeader("Referer");
	}
}
