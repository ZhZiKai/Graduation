package com.cn.graduation.listener;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SystemFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 if (!(servletRequest instanceof HttpServletRequest) || !(servletResponse instanceof HttpServletResponse)) {  
			 throw new ServletException("OncePerRequestFilter just supports HTTP requests");  
	     } 
		 HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;  
         HttpServletResponse httpResponse = (HttpServletResponse) servletResponse; 
         if(httpRequest.getSession().getAttribute("admin")==null||httpRequest.getSession().getAttribute("admin").equals(""))
     	 {
        	 /*httpRequest.getRequestDispatcher("/user/admin/redirect").forward(httpRequest, httpResponse);*/
        	 httpResponse.sendRedirect("/Graduation/user/admin/redirect");
     		 return ;
     	 }  
         filterChain.doFilter(servletRequest, servletResponse);  
         return ;  
	}
	
	/** 
     * 判断是否为Ajax请求 
     * 
     * @param request HttpServletRequest 
     * @return 是true, 否false 
     */  
    public static boolean isAjaxRequest(HttpServletRequest request) {  
        return request.getRequestURI().startsWith("/api");  
    } 
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
