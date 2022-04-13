package web_spring_mvc.Service.User;

import java.util.List;

import web_spring_mvc.Dto.Cart1Dto;

public interface ICart1Service {
	public int AddProductCart(String cartId, String productId, String quantity);
	public List<Cart1Dto> GetDataCartAll(String cartId);
	public int TotalQuantity(List<Cart1Dto> list);
	public long TotalPrice(List<Cart1Dto> list);
	public int DeleteProductCart(String cartID, int productId);
}
