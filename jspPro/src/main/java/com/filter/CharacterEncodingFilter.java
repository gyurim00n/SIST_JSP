package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;


//@WebFilter("/CharacterEncodingFilter")
public class CharacterEncodingFilter extends HttpFilter implements Filter {
       private String encoding;
    
    public CharacterEncodingFilter() {
        super();
 
    }

	
	public void destroy() {
	
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("😊😊😊CharacterEncoding.doFilter() ");
		
		//필터링할 작업은 여기에 코딩..
		request.setCharacterEncoding(this.encoding);

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		/*	web.xml
		 * <init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</
		 * 	*/
		this.encoding = fConfig.getInitParameter("encoding"); 
		if(this.encoding == null) 	this.encoding = "UTF-8";
		
		
		
	}

}
