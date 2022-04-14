package web_spring_mvc.Service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.TypeProductDao;
import web_spring_mvc.Entity.TypeProductEntity;

@Service
public class TypeProductAdminServiceImpl implements ITypeProductAdminService{

	@Autowired
	private TypeProductDao typeProductDao;
	
	// find all type
	@Override
	public List<TypeProductEntity> GetTypeProduct() {
		return typeProductDao.GetTypeProduct();
	}

}
