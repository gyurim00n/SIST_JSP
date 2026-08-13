package days05.board;

import java.io.IOException;
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

@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public View() {
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
		
		System.out.println(">View.doGet()...");
		
		long seq = Long.parseLong(request.getParameter("seq"));
		  
		//1.a목록로직처리
		Connection conn = DBConn.getConnection();
		BoardDTO dto = null;
		BoardDAO dao = new BoardDAOImpl(conn);
		int rowCount =0;
		try {
			conn.setAutoCommit(false);
			
		//[1] seq=155 조회수 1 증가
			rowCount = dao.increaseReaded(seq);
			
		//[2] seq=155 게시글 정보.
			dto = dao.view(seq);
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println(">3. View.doGet() Exception....");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DBConn.close();
		}
		
		request.setAttribute("dto", dto);
		
		//2.view.jsp 로 포워딩..
		String path = "/days05/board/view.jsp";//슬래쉬 시작: context path 다음부터 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
