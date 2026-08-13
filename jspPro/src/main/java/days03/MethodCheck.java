package days03;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(description = "서블릿에서 get/post 요청 체크용.", urlPatterns = { "/days03/ex01_ok_03.ss" })
public class MethodCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MethodCheck() {
		super();

	}

	// get 방식 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(">서블릿 get 방식 요청");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name2");
		int age = Integer.parseInt(request.getParameter("age2"));
		out.println("<html>");
		out.println("<head><title>인사</title></head>");
		out.println("<body>");
		out.println("안녕하세요.<br>");

		out.println("> 이름 : " + name + "<br>");
		out.println("> 나이 : " + age + "<br>");

		out.println("</body>");
		out.println("</html>");
	}

	// post 방식 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(">서블릿 post 방식 요청");
		// doGet(request, response); // get, post 같은 함수면 이런식으로만 적어도 된다.

	
		 PrintWriter out = response.getWriter(); String name =
		 request.getParameter("name2"); int age =
		 Integer.parseInt(request.getParameter("age2")); out.println("<html>");
		 out.println("<head><title>인사</title></head>"); out.println("<body>");
		 out.println("안녕하세요.<br>");
		 
		 out.println("> 이름 : " + name +"<br>"); out.println("> 나이 : " + age +"<br>");
		  
		 out.println("</body>"); out.println("</html>");
		 
	}

}
