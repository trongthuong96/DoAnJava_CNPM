package web_spring_mvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCart implements RowMapper<CartEntity>{

	@Override
	public CartEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		CartEntity cart = new CartEntity();
		cart.setCartId(rs.getString("cartId"));
		cart.setProductId(rs.getInt("productId"));
		cart.setQuantiy(rs.getInt("quantity"));
		cart.setTotalPrice(rs.getLong("totalPrice"));
		
		return cart;
	}

}
