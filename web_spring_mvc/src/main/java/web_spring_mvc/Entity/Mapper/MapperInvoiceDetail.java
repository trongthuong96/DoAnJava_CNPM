package web_spring_mvc.Entity.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import web_spring_mvc.Entity.InvoiceDetailEntity;

public class MapperInvoiceDetail implements RowMapper<InvoiceDetailEntity>{

	@Override
	public InvoiceDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		InvoiceDetailEntity invoiceDetail = new InvoiceDetailEntity();
		invoiceDetail.setId(rs.getLong("id"));
		invoiceDetail.setInvoiceId(rs.getInt("invoiceId"));
		invoiceDetail.setQuantity(rs.getInt("quantity"));
		invoiceDetail.setPrice(rs.getLong("price"));
		invoiceDetail.setTotalPrice(rs.getLong("totalPrice"));
		invoiceDetail.setProductId(rs.getInt("productId"));
		invoiceDetail.setProductName(rs.getString("productName"));
		
		return invoiceDetail;
	}

}