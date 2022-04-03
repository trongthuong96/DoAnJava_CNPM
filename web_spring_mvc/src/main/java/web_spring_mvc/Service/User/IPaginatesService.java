package web_spring_mvc.Service.User;

import web_spring_mvc.Dto.PaginatesDto;

public interface IPaginatesService {
	public PaginatesDto GetInfoPaginates(int totalData, int limit, int currentPage);
	public int CheckCurrentPage(int currentPage, int totalPage);
}
