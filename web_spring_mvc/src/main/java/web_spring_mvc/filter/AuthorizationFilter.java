package web_spring_mvc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_spring_mvc.Dto.RoleUserDto;
import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.utils.SessionUtil;

public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        
    	HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        
        String url = request.getRequestURI();
        UserEntity model = (UserEntity) SessionUtil.getInstance().getValue(request, "LoginInfo");
        
        if (url.startsWith("/web_spring_mvc/thanh-toan")) {
           
            if (model == null) {
                 response.sendRedirect(request.getContextPath()+"/dang-nhap?redirect=thanh-toan");
               
            } else {
            	 filterChain.doFilter(servletRequest, servletResponse);
            }
		} else if(url.startsWith("/web_spring_mvc/quan-tri")) {
			  
				  if(model != null) { RoleUserDto dto = (RoleUserDto)
					  SessionUtil.getInstance().getValue(request, "RoleUser");
				  
					  if(dto == null) {
						  response.sendRedirect(request.getContextPath()+"/dang-nhap?redirect=quan-tri"); 
					  } else {
						  filterChain.doFilter(servletRequest, servletResponse);
					  }
				  } else {
					  response.sendRedirect(request.getContextPath()+"/dang-nhap?redirect=quan-tri"); 
				  	} 
			  }
			 
        else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}