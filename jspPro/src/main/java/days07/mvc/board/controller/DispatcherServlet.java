package days07.mvc.board.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import days07.mvc.board.command.CommandHandler;
import days07.mvc.board.command.NullHandler;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DispatcherServlet() {
        super();
       
    }

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		//properties 파일을 읽어서 요청url, classNAme -> Map에 저장
		//실제 요청이 들어오면 map 안에 해당된는 handler 가져와서 일을 시키겠다.
		super.init();
		System.out.println("🤣🤣🤣 DispatcherServlet.init().,.");
		String urlMappingPath = this.getInitParameter("urlMappingPath");
		//urlMappingPath -> Properties p 저장
		System.out.println("😍😍😍urlMappingPath:" + urlMappingPath);
		String realPath = this.getServletContext().getRealPath(urlMappingPath); //배포되는 실제 경로를 잡아야한다...
		//
		Properties p = new Properties();
		try(
			FileReader reader = new FileReader(realPath)
			){
			p.load(reader);
			
		}catch(Exception e) {
			throw new ServletException(e);
		}
		//Properties p -> commandHandlerMap 저장
		Set<Entry<Object, Object>> set =  p.entrySet();
		Iterator<Entry<Object, Object>> ir = set.iterator();
		while (ir.hasNext()) {
	         Entry<Object, Object> entry = ir.next();
	         String url = (String) entry.getKey();
	         String fullName = (String) entry.getValue();
	         // fullName 문자열 -> 생성된 커맨드 객체
	         try {
	            Class<?> commmandHandlerClass = Class.forName(fullName);
	            CommandHandler handler = (CommandHandler) commmandHandlerClass
	                                       .getDeclaredConstructor()
	                                       .newInstance();
	            commandHandlerMap.put(url, handler);
	         } catch (Exception e) { 
	            e.printStackTrace();
	         }
	           
	      } // while
		
		System.out.println("??" + this.commandHandlerMap.size());
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청url을 분석한다
		String requestURI = request.getRequestURI(); //
		System.out.println("😊😊😊 requestURI: " + requestURI);
		String contextPath= request.getContextPath();// /jspPro =>/
		String path = requestURI.substring(contextPath.length());
		System.out.println("😊😊😊 path: " + path);
		
		//2.요청을 처리할 핸들러 객체를 map으로부터 얻어오기....
		CommandHandler handler = this.commandHandlerMap.get(path);
		
		if(handler == null) {
			handler = new NullHandler();
		}
		
		//3.핸들러 객체 실행...
		String viewName = null;
		try {
			viewName = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}//try
		
		//4.
		if(viewName == null) {
			return ;
		}
		
		
		if(viewName.startsWith("redirect:")){
			//5-2 리다이렉트...
			String location = viewName.substring("redirect:".length());
			response.sendRedirect(location);
			
		}else {
			//5.포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
			dispatcher.forward(request, response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
