package web_spring_mvc.Dao;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web_spring_mvc.Dto.CartDto;
import web_spring_mvc.Dto.ProductDto;

@Repository
public class CartDao extends BaseDao{
	
	@Autowired
	ProductDao productDao = new ProductDao();
	
	// add product to cart
	public HashMap<Integer, CartDto> AddCart(int id, HashMap<Integer, CartDto> cart) {
		CartDto itemCart = new CartDto();
		ProductDto product = productDao.GetDataProductById(id);
		if(product != null && cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuantity(itemCart.getQuantity() + 1);
			itemCart.setTotalPrice(itemCart.getProduct().getPrice() * itemCart.getQuantity());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(1);
			itemCart.setTotalPrice(product.getPrice());
		}
		cart.put(id, itemCart);
		return cart;
	}
	
	// edit product to cart
	public HashMap<Integer, CartDto> EditCart(int id,int quantity, HashMap<Integer, CartDto> cart) {
		
		CartDto itemCart = new CartDto();
		// kiá»ƒm tra xem cÃ³ sáº£n pháº©m trong cart chÆ°a
		if(cart.containsKey(id)) {
			itemCart = cart.get(id);
			itemCart.setQuantity(quantity);
			double totalPrice = quantity * itemCart.getProduct().getPrice();
			itemCart.setTotalPrice(totalPrice);
		}
		
		cart.put(id, itemCart);
		return cart;
	}
	
	//delete product to cart
	public HashMap<Integer, CartDto> DeleteCart(int id, HashMap<Integer, CartDto> cart) {
		if (cart == null) {
			return cart;
		}
		
		if(cart.containsKey(id)) {
			cart.remove(id);
		}
		return cart;
	}
	
	// tá»•ng sáº£n pháº©m trong giá»� hÃ ng
	public int TotalQuantity(HashMap<Integer, CartDto> cart) {
		int totalQuantity = 0;
		for(Map.Entry<Integer, CartDto> itemCart : cart.entrySet()) {
			totalQuantity += itemCart.getValue().getQuantity();
		}
		return totalQuantity;
	}
	
	// tá»•ng giÃ¡ trong giá»� hÃ ng
		public double TotalPrice(HashMap<Integer, CartDto> cart) {
			double totalPrice = 0;
			for(Map.Entry<Integer, CartDto> itemCart : cart.entrySet()) {
				totalPrice += itemCart.getValue().getTotalPrice();
			}
			return totalPrice;
		}
}
