package days07.mvc.board.command;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {

	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.로직 처리
		System.out.println("> View Handler 07.process() ...");
		
		long seq = Long.parseLong(request.getParameter("seq"));
		  
		//1.a목록로직처리
		Connection conn = ConnectionProvider.getConnection();
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
			System.out.println(">3. ViewHandler.process Exception....");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				//list.htm으로 리다이렉트...
			}
			conn.close();
		}
		
		request.setAttribute("dto", dto);
		
	
		return "/WEB-INF/views/days07/board/view.jsp";
	}

}
