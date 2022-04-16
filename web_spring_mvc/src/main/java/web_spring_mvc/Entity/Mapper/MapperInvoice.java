package web_spring_mvc.Entity.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import web_spring_mvc.Entity.InvoiceEntity;

public class MapperInvoice implements RowMapper<InvoiceEntity>{

	@Override
	public InvoiceEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		InvoiceEntity invoice = new InvoiceEntity();
		invoice.setId(rs.getInt("id"));
		invoice.setAccountId(rs.getInt("accountId"));
		invoice.setDateAdded(rs.getDate("dateAdded"));
		invoice.setDateDelivery(rs.getDate("dateDelivery"));
		invoice.setStatus(rs.getInt("status"));
		
		return invoice;
	}

}