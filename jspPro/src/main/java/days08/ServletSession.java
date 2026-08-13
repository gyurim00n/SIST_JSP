package days08;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/days08/session.do")
public class ServletSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletSession() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//AuthUser 로그인한 사용자 정보.. -> 서블릿에서 -> 세션에 저장...
		String loginUser = "hong";
		String loginUserRole = "MANAGER";
		AuthUser authUser = AuthUser.builder()
									.loginUser(loginUser)
									.loginUserRole(loginUserRole)
									.build();
		//request.getSession(); ==request.getSession(true); //세션 객체가 존재하지 않으면 세션을 생성해서 반환한다.
		
		//request.getSession(false); // 세션 객체가 존재하지 않으면 null을 반환...
		HttpSession session = request.getSession();//서블릿에서는 session 객체가 없어서 리퀘스트에서 받아와야한다. 
		session.setAttribute("authUser", authUser);
		/*
		 * if(session == null) { //절대로 이렇게 될일이 없다. //
		 * 
		 * }
		 */
		
		
		
				//new AuthUser(id, "MANAGER ")
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
