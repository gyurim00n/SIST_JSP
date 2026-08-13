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

@WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Write() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("write doGet() 호출됨...");
		
		
		
		String path = "/days05/board/write.jsp";//슬래쉬 시작: context path 다음부터 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("write doPost() 호출됨...");
		
		String writer= request.getParameter("writer");
		String pwd= request.getParameter("pwd");
		String email= request.getParameter("email");
		String title= request.getParameter("title");
		String content =request.getParameter("content");
		int tag =Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO bDto = BoardDTO.builder()
						.writer(writer)
						.pwd(pwd)
						.email(email)
						.title(title)
						.content(content)
						.tag(tag)
						.build();
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		int rowCount = 0;
		
		try {
			 int newSeq = dao.getNextSeq();
	         bDto.setSeq(newSeq);
			
			rowCount = dao.insert(bDto);
			
			if(rowCount ==1) {	//글쓰기 성공
				//String location="/cstvsboard";
				
				// [2]
	            String location = "/cstvsboard/list.htm";
	            PrintWriter out = response.getWriter();

	            out.println("<script>");
	            out.println("alert('"+ newSeq+"번 글쓰기가 완료되었습니다.');");
	            out.println("location.href='" + location + "';");
	            out.println("</script>");
				/*
				 * //1.list.jsp 리다이렉트 String location = "/cstvsboard/list.htm?success=true";
				 * //sublet을 호출하기 위한 url. days05/board/파일명.jsp는 파일의 경로다.
				 * response.sendRedirect(location); //클라이언트한테 와서 다시 요청. List.java 요청.->doget
				 * 실행....
				 */			}else {	//글쓰기 실패
				System.out.println("2. Write.doPost()글쓰기 실패........");
				
			}
		
			
		} catch (SQLException e) {
			System.out.println(">2. Write.doPost() Exception....");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
		
		
	}

}
