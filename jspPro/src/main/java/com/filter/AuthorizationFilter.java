package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import days08.AuthUser;


//@WebFilter("/CharacterEncodingFilter")
public class AuthorizationFilter extends HttpFilter implements Filter {
       private String encoding;
    
    public AuthorizationFilter() {
        super();
 
    }

	
	public void destroy() {
	
	}


	public void doFilter(ServletRequest frequest, ServletResponse fresponse, FilterChain chain) throws IOException, ServletException {
		System.out.println("😊AuthorizationFilter.doFilter() ");
		
		HttpServletRequest request = (HttpServletRequest)frequest;
		HttpServletResponse response = (HttpServletResponse)fresponse;
		
		HttpSession session = request.getSession(false); // 세션 객체가 생성되지 않을시 null 반환
		AuthUser authUser = (AuthUser)session.getAttribute("authUser");
		
		String loginUserRole = authUser.getLoginUserRole();  // ADMIN, MANAGER, USER
		
		if(!loginUserRole.equals("ADMIN")) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			
			return ;
		} //권한 x
		
		//필터링할 작업은 여기에 코딩....
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		
		
		
		
	}

}
