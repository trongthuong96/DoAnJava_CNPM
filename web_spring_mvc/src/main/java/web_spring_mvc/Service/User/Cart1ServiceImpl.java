package web_spring_mvc.Service.User;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.swing.text.html.parser.Entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.Cart1Dao;
import web_spring_mvc.Dao.ProductDao;
import web_spring_mvc.Dto.Cart1Dto;
import web_spring_mvc.Entity.CartEntity;

@Service
public class Cart1ServiceImpl implements ICart1Service{
	
	@Autowired
	private Cart1Dao cart1Dao;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public int AddProductCart(String cartId, String productId, String quantity) {
		try {
			int idProduct = Integer.parseInt(productId);
			int qua = Integer.parseInt(quantity);
			
			CartEntity cart = cart1Dao.GetDataCart(cartId, idProduct);
			
			if (cart == null) {
				cart = new CartEntity();
				cart.setProductId(idProduct);
				cart.setCartId(cartId);
				cart.setQuantiy(qua);
				long totalPrice = cart.getQuantiy()* productDao.GetDataProductById(idProduct).getPrice();
				cart.setTotalPrice(totalPrice);
				cart1Dao.AddProductCart(cart);
			} else {
				
				cart.setQuantiy(qua);
				long totalPrice = cart.getQuantiy()* productDao.GetDataProductById(idProduct).getPrice();
				cart.setTotalPrice(totalPrice);
				cart1Dao.EditProductCart(cart);
			}
			return 1;
			
		} catch(Exception e) {
			return 1;
		}
	}

	@Override
	public List<Cart1Dto> GetDataCartAll(String cartId) {
		return cart1Dao.GetDataCartAll(cartId);
	}
	
	
	@Override
	public int TotalQuantity(List<Cart1Dto> list) {
		return cart1Dao.TotalQuantity(list);
	}

	@Override
	public long TotalPrice(List<Cart1Dto> list) {
		return cart1Dao.TotalPrice(list);
	}

	@Override
	public int DeleteProductCart(String cartID, int productId) {
		return cart1Dao.DeleteProductCart(cartID, productId);
	}

}
