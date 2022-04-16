package web_spring_mvc.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import web_spring_mvc.Dto.Cart1Dto;
import web_spring_mvc.Entity.CartEntity;
import web_spring_mvc.Entity.InvoiceDetailEntity;

@Repository
public class CheckoutDao extends BaseDao{
	
	int insert = 0;
	//INSERT INVOICE AND INVOICE DETAIL
	public int InserInvoice_InvoiceDetail(int accountId, List<Cart1Dto> listCart) {
			
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO invoice (");
		sql.append("accountId, ");
		sql.append("dateAdded, ");
		sql.append("dateDelivery, ");
		sql.append("status) ");
		sql.append("VALUES (");
		sql.append(accountId +", ");
		sql.append(" now(), ");
		sql.append(" NOW() + INTERVAL 7 DAY, ");
		sql.append(0 +") ");
		
		try {
			// insert and get id
			GeneratedKeyHolder holder = new GeneratedKeyHolder();
			insert = _jdbcTemplate.update(new PreparedStatementCreator() {
			    @Override
			    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
			        PreparedStatement statement = con.prepareStatement(sql.toString(), new String[] { "id" });
			        return statement;
			    }
			}, holder);
			
			int invoiceId = holder.getKey().intValue();
			
			listCart.forEach((item)->{
				// insert invoice detail
				StringBuilder sqlDetail = new StringBuilder();
				sqlDetail.append("INSERT INTO invoicedetail (");
				sqlDetail.append("invoiceId, ");
				sqlDetail.append("quantity, ");
				sqlDetail.append("price, ");
				sqlDetail.append("totalPrice, ");
				sqlDetail.append("productId, ");
				sqlDetail.append("productName) ");
				sqlDetail.append("VALUES (");
				sqlDetail.append(invoiceId +", ");
				sqlDetail.append(item.getQuantity() + ", ");
				sqlDetail.append(item.getProduct().getPrice() +", ");
				sqlDetail.append(item.getTotalPrice() +", ");
				sqlDetail.append(item.getProductId() +", ");
				sqlDetail.append("'" + item.getProduct().getProductName() +"') ");
				
				insert = _jdbcTemplate.update(sqlDetail.toString());
			});
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		return insert;
	}
}
