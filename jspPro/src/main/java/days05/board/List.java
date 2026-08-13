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

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public List() {
        super();
      
    }

    int currentPage = 1;    // 현재 페이지 번호
    int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
    int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0;   // 총 레코드 수
    int totalPages = 0 ;    // 총 페이지 수
    
    //http://localhost/cstvboard/list.htm			null
    //http://localhost/cstvboard/list.htm?currentPage ""
    //http://localhost/cstvboard/list.htm?currentPage=1
    //http://localhost/cstvboard/list.htm?currentPage=1&searchCondition=t&searchKeyword=검색어
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서블릿 오류 시 
		System.out.println(">List.doGet()...");
		//1.목록 로직 처리...
		//[1] 현재 페이지
		String pCurrentPage = (request.getParameter("currentPage"));
		if (pCurrentPage == null || pCurrentPage.isBlank()){
			pCurrentPage = "1";
			
		}
		currentPage = Integer.parseInt(pCurrentPage);
		//null-> 1,""-> 1, "  " -> 1..
		//[2] 한 페이지에 출력할 게시글 수...
		try {
			this.numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
			
		} catch (Exception e) {
			
			this.numberPerPage = 10;
		}
		
		//[3]+[4] 검색조건, 검색어...
		String searchCondition = request.getParameter("searchCondition");

		if (searchCondition == null || searchCondition.isBlank()){
			searchCondition = "t";
		}
		String searchKeyword = request.getParameter("searchKeyword"); // null, ""

		
		Connection conn = DBConn.getConnection();
		java.util.List<BoardDTO> list = null; //이름 충돌때문에 이렇게 명시해야함.
		PageDTO pDto = null;
		BoardDAO dao = new BoardDAOImpl(conn);


		try {
			//[1] 페이징 처리 X
			//list = dao.select();
			
			//[2] 페이징  처리 O
			//list = dao.select(currentPage, numberPerPage);
			//[4] 페이징 처리+_ 검색처리 0
			if (searchKeyword == null || searchKeyword.isBlank()) {
				pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock);
				list = dao.select(currentPage, numberPerPage);
			}else {
		
				pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, searchCondition, searchKeyword );
				list=dao.search(searchCondition, searchKeyword, currentPage, numberPerPage);
				
			}
			//[3] 페이징 블럭 처리...[1] 2 3... 10 >
			//pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock);
			
		} catch (SQLException e) {
			System.out.println(">1. List.doGet() Exception....");
			e.printStackTrace();
		} finally {
			DBConn.close();
		}
		
		request.setAttribute("list", list); 
		request.setAttribute("pDto", pDto); 

		//request.setAttribute("searchKeyword", searchKeyword);
		
		//2.list.jsp 로 포워딩..
		String path = "/days05/board/list.jsp";//슬래쉬 시작: context path 다음부터 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
