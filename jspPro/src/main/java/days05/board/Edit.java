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

@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Edit() {
        super();
      
    }

    int currentPage = 1;    // 현재 페이지 번호
    int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
    int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0;   // 총 레코드 수
    int totalPages = 0 ;    // 총 페이지 수
    
  
    //http://localhost/cstvboard/view.htm?seq=155			null
    //http://localhost/cstvboard/list.htm?currentPage ""
    //http://localhost/cstvboard/list.htm?currentPage=1
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(">Edit.doGet()...");
		//http://localhost/cstvsboard/view.htm?seq=150
		//1. 수정 로직처리
		long seq = Long.parseLong(request.getParameter("seq"));
		  
		//1.a목록로직처리
		Connection conn = DBConn.getConnection();
		BoardDTO dto = null;
		BoardDAO dao = new BoardDAOImpl(conn);
		
		try {
			conn.setAutoCommit(false);
			
		//[1] seq=155 조회수 1 증가
			//rowCount = dao.increaseReaded(seq);
			
		//[2] seq=155 게시글 정보.
			dto = dao.view(seq);
			//conn.commit();
		} catch (SQLException e) {
		
			System.out.println(">3. Edit.doGet() Exception....");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
		
		request.setAttribute("dto", dto);
		//2.view.jsp 로 포워딩..
		String path = "/days05/board/edit.jsp";//슬래쉬 시작: context path 다음부터 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("Edit doPost() 호출됨...");
		long seq = Long.parseLong(request.getParameter("seq"));
		//String writer= request.getParameter("writer");
		String pwd= request.getParameter("pwd");
		String email= request.getParameter("email");
		String title= request.getParameter("title");
		String content =request.getParameter("content");
		int tag =Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO bDto = BoardDTO.builder()
						//.writer(writer)
						.seq(seq)
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
			
			rowCount = dao.update(bDto);
			PrintWriter out = response.getWriter();

			if(rowCount ==1) {	
	            String location = "/cstvsboard/view.htm?seq=" +seq ;
	            
	            out.println("<script>");
	            out.println("alert('"+ seq+"번 게시글 수정 완료되었습니다.')");
	            out.println("location.href='" + location + "';");
	            out.println("</script>");
			}else {	//글쓰기 실패
				System.out.println("2. Edit.doPost() 수정 실패........");
				out.println("<script>");
	            out.println("alert('"+ seq+"번 게시글 수정 실패...')");
	            out.println("history.back();");
	            out.println("</script>");
			}
		
			
		} catch (SQLException e) {
			System.out.println(">2. Edit.doPost() Exception....");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
		
	}

}
