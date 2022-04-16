package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.Cart1Dto;

public interface ICheckoutService {
	public int InserInvoice_InvoiceDetail(int accountId, List<Cart1Dto> listCart);
}
