package web_spring_mvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web_spring_mvc.Dto.Cart1Dto;
import web_spring_mvc.Dto.ProductDto;
import web_spring_mvc.Entity.CartEntity;
import web_spring_mvc.Entity.MapperCart;

@Repository
public class Cart1Dao extends BaseDao{
	
	@Autowired
	private ProductDao productDao;
	
	// ADD product to cart
		public int AddProductCart(CartEntity cart) {
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO cart (");
			sql.append("cartId, ");
			sql.append("productId, ");
			sql.append("quantity, ");
			sql.append("totalPrice) ");
			sql.append("VALUES (");
			sql.append("'" + cart.getCartId() +"', ");
			sql.append("'" + cart.getProductId() +"', ");
			sql.append("'" + cart.getQuantiy() +"', ");
			sql.append("'" + cart.getTotalPrice() +"') ");

			int insert = 0;
			try {
				insert = _jdbcTemplate.update(sql.toString());
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			return insert;
		}
		
		// Edit product to cart
		public int EditProductCart(CartEntity cart) {
			
			int update = 0;
			
			try {
				ProductDto product = productDao.GetDataProductById(cart.getProductId());
				if(product.getQuantity() < cart.getQuantiy() || cart.getQuantiy() < 1) {
					return update;
				}
			}catch(Exception e) {
				return update;
			}
			
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE cart SET ");
			sql.append("quantity = " + cart.getQuantiy());
			sql.append(" ,totalPrice = " + cart.getTotalPrice());
			sql.append(" WHERE cartId = '" + cart.getCartId() + "'");
			sql.append(" AND productId = " + cart.getProductId());

			try {
				update = _jdbcTemplate.update(sql.toString());
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			return update;
		}

		// Delete product to cart
		public int DeleteProductCart(String cartID, int productId) {
			
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM cart WHERE ");
			sql.append("cartId = '" + cartID + "' ");
			sql.append(" AND productId = " + productId);

			int delete = 0;
			try {
				delete = _jdbcTemplate.update(sql.toString());
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			return delete;
		}

		//sql query
		private StringBuilder SqlString() {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ");
			sql.append("cartId, ");
			sql.append("productId, ");
			sql.append("quantity, ");
			sql.append("totalPrice ");
			sql.append("FROM cart ");
			
			return sql;
		}
		
		// find all product by cartId in cart
		public List<Cart1Dto> GetDataCartAll(String cartId) {
			StringBuilder sql = SqlString();
			sql.append("WHERE (cartId = '" + cartId +"')");
			
			try {
				List<Cart1Dto> listDto = new ArrayList<Cart1Dto>();
				List<CartEntity> listEntity =  _jdbcTemplate.query(sql.toString(), new MapperCart());
				
				listEntity.forEach((cartEntity) -> {
					Cart1Dto cart1Dto = new Cart1Dto();
					cart1Dto.setCartId(cartEntity.getCartId());
					cart1Dto.setProductId(cartEntity.getProductId());
					cart1Dto.setQuantity(cartEntity.getQuantiy());
					cart1Dto.setTotalPrice(cartEntity.getTotalPrice());
					cart1Dto.setProduct(productDao.GetDataProductById(cart1Dto.getProductId()));
					listDto.add(cart1Dto);
				});
				
				return listDto;
			} catch (Exception e) {
				return null;
			}
		}
		
		// find one product in cart
		public CartEntity GetDataCart(String idCart, int productId) {
			StringBuilder sql = SqlString();
			sql.append("WHERE (cartId = '" + idCart +"' and productId = "+ productId + ")");
			
			try {
				return _jdbcTemplate.queryForObject(sql.toString(), new MapperCart());
			} catch (Exception e) {
				return null;
			}
		}
		
		// total quantity
		int totalQuantity;
		public int TotalQuantity(List<Cart1Dto> list) {
			totalQuantity = 0;
			list.forEach((item) -> {
				totalQuantity += item.getQuantity();
			});
			return totalQuantity;
		}
		
		// total quantity
		long totalPrice;
		public long TotalPrice(List<Cart1Dto> list) {
			totalPrice = 0;
			list.forEach((item) -> {
				totalPrice += item.getTotalPrice();
			});
			return totalPrice;
		}
}
