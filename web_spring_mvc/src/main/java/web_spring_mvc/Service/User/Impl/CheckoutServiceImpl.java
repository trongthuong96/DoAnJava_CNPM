package web_spring_mvc.Service.User.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.CheckoutDao;
import web_spring_mvc.Dto.Cart1Dto;
import web_spring_mvc.Service.User.ICheckoutService;

@Service
public class CheckoutServiceImpl implements ICheckoutService{

	@Autowired
	private CheckoutDao checkoutDao;
	
	@Override
	public int InserInvoice_InvoiceDetail(int accountId, List<Cart1Dto> listCart) {
		return checkoutDao.InserInvoice_InvoiceDetail(accountId, listCart);
	}

}
