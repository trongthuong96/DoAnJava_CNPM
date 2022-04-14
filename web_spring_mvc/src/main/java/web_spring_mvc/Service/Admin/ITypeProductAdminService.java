package web_spring_mvc.Service.Admin;

import java.util.List;

import web_spring_mvc.Entity.TypeProductEntity;

public interface ITypeProductAdminService {
	
	// find all type
	public List<TypeProductEntity> GetTypeProduct();
}
