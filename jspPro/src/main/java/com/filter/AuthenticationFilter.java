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
public class AuthenticationFilter extends HttpFilter implements Filter {
       private String encoding;
    
    public AuthenticationFilter() {
        super();
 
    }

	
	public void destroy() {
	
	}


	public void doFilter(ServletRequest frequest, ServletResponse fresponse, FilterChain chain) throws IOException, ServletException {
		System.out.println("😊😊AuthenticationFilter.doFilter() ");
		//누군지 확인하는 작업. 직급까진 안따진다. 없으면 인증 x
		//authUser 세션이름으로 저장...AuthUser
		//
		HttpServletRequest request = (HttpServletRequest)frequest;
		HttpServletResponse response = (HttpServletResponse)fresponse;
		
		HttpSession session = request.getSession(false); // 세션 객체가 생성되지 않을시 null 반환
		AuthUser authUser = null;
		boolean isLogon = false; //true 인증 o, false 인증 x 
		
		if(session!= null) {
			authUser = (AuthUser)session.getAttribute("authUser");
			if(authUser != null) isLogon = true;
		}
		
		//필터는 용도별로 나누는게 관리하기 편하다....
		if (isLogon) {
			chain.doFilter(request, response);//필수구문. 다음 필터로 넘기겠다.
		}else { //인증 X -> 로그인 페이지로 리다이렉트. 
			//로그온 url이 보이기 위해서... 리다이렉트 사용.
			//원래 요청했던 url 저장...
			String referer = request.getRequestURI();
			session.setAttribute("referer", referer);
			String location = "/days09/member/logon.jsp";
			response.sendRedirect(location);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		
		
		
		
	}

}
