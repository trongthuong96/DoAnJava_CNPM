package web_spring_mvc.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web_spring_mvc.Dao.BannerDao;
import web_spring_mvc.Entity.Banner;

@Service
public class BannerServiceImpl implements IBannerService{

	@Autowired
	private BannerDao bannerDao;
	
	@Override
	public List<Banner> GetDataBanner() {
		return bannerDao.GetDataBanner();
	}

}
