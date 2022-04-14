package web_spring_mvc.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_spring_mvc.Entity.UserEntity;
import web_spring_mvc.utils.SessionUtil;

import java.io.IOException;

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
        if (url.startsWith("/web_spring_mvc/thanh-toan")) {
            UserEntity model = (UserEntity) SessionUtil.getInstance().getValue(request, "LoginInfo");
            if (model == null) {
               
                    response.sendRedirect(request.getContextPath()+"/dang-nhap?redirect=thanh-toan");
               
            } else {
            	 filterChain.doFilter(servletRequest, servletResponse);
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}