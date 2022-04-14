package web_spring_mvc.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.ManufacturerDao;
import web_spring_mvc.Entity.ManufacturerEntity;

@Service
public class ManuServiceImpl implements IManuService{

	@Autowired
	private ManufacturerDao manufacturerDao;
	
	@Override
	public List<ManufacturerEntity> GetDataAllManufacturer() {
		return manufacturerDao.GetDataAllManufacturer();
	}

}
