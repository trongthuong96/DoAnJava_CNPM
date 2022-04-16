package web_spring_mvc.Entity.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import web_spring_mvc.Entity.CartEntity;

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
