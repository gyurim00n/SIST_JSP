package days05.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days05.board.domain.BoardDTO;
import days05.board.domain.PageDTO;
import days05.board.persistence.BoardDAO;
import days05.board.persistence.BoardDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Delete() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Delete doGet() 호출됨...");
		
		
		
		String path = "/days05/board/delete.jsp";//슬래쉬 시작: context path 다음부터 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("Delete doPost() 호출됨...");
		
		long seq = Long.parseLong(request.getParameter("seq"));
		String pwd = request.getParameter("pwd");
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		int rowCount = 0;
		
		try {
			
			rowCount = dao.delete(seq, pwd);
			PrintWriter out = response.getWriter();

			if(rowCount ==1) {	//글 삭제 성공
	            String location = "/cstvsboard/list.htm";
	            
	            out.println("<script>");
	            out.println("alert('"+ seq+"번 게시글 삭제 완료되었습니다.')");
	            out.println("location.href='" + location + "';");
	            out.println("</script>");
			}else {	//글쓰기 실패
				System.out.println("2. Delete.doPost() 삭제 실패........");
				out.println("<script>");
	            out.println("alert('"+ seq+"번 게시글 삭제 실패...')");
	            out.println("history.back();");
	            out.println("</script>");
			}
		
			
		} catch (SQLException e) {
			System.out.println(">2. Delete.doPost() Exception....");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
	}

}
