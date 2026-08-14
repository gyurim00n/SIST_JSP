package days07.mvc.board.command;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import days08.AuthUser;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditHandler implements CommandHandler {
	int currentPage = 1;    // 현재 페이지 번호
	int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
	int numberOfPageBlock = 10;  // [1] 2 3 4 5 6 7 8 9 10 >
	int totalRecords = 0;   // 총 레코드 수
	int totalPages = 0 ;    // 총 페이지 수
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		AuthUser authUser = (session != null) ? (AuthUser) session.getAttribute("authUser") : null;
		boolean isAdmin = false;
		boolean isWriter = false;
		if (authUser == null) {
			out.println("<script>");
			out.println("  alert('로그인이 필요한 서비스입니다.');");
			out.println("  location.href='" + request.getContextPath() + "/days08/board/ex02_default.jsp';");
			out.println("</script>");
			out.flush();
			return null;
		}

		// ===============================================================
		//doGet, doPost 쓸수 없어서 if문으로 getMethod=GET/ POST 분리
		String requestMethod = request.getMethod();
		if(requestMethod.equals("GET")) {
			
			long seq = Long.parseLong(request.getParameter("seq"));

			//1.a목록로직처리
			Connection conn = ConnectionProvider.getConnection();
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
				conn.close();
			}
			
			isAdmin = "ADMIN".equalsIgnoreCase(authUser.getLoginUserRole());
			isWriter = authUser.getLoginUser().equals(dto.getWriter());

			if (!isWriter) {
				out.println("<script>");
				out.println("  alert('수정 권한이 없습니다.');");
				out.println("  history.back();");
				out.println("</script>");
				out.flush();
				return null;
			}

			request.setAttribute("dto", dto);
			request.setAttribute("dto", dto);
			return "/WEB-INF/views/days07/board/edit.jsp";

		}else if(requestMethod.equals("POST")) {
			response.setContentType("text/html; charset=UTF-8");
			
			System.out.println("EditHandler doPost() 호출됨...");
			long seq = Long.parseLong(request.getParameter("seq"));
			String writer= request.getParameter("writer");
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
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			int rowCount = 0;
		
			try {
				
				rowCount = dao.update(bDto);
				
				
				if(rowCount ==1) {	
					
		            String location = request.getContextPath() + "/mvc/board/view.htm?seq=" +seq ;
		            
					
					out.println("<script>"); out.println("alert('"+ seq+"번 게시글 수정 완료되었습니다.')");
					out.println("location.href='" + location + "';"); out.println("</script>");
					
					return null;
					
				}else {	//글쓰기 실패
					System.out.println("2. EditHandler.doPost() 수정 실패........");
					
					/*
					 * //request.setAttribute("bDto", bDto);
					 * request.getSession().setAttribute("bDto", bDto); return "redirect:" +
					 * "/mvc/board/edit.htm?seq="+seq+"&edit=fail"; //새로운 요청이라서 수정해도 갖고 가는게 없다.
					 */					
					 out.println("<script>"); 
					 out.println("alert('"+ seq+"번 게시글 수정 실패...')");
					 out.println("history.back();"); 
					 out.println("</script>");
					 return null;
				}
			
				
			} catch (SQLException e) {
				System.out.println(">2. EditHandler.doPost() Exception....");
				e.printStackTrace();
			} finally {
				conn.close();
			}
			
			
		}
		//System.out.println("❤️❤️❤️ Edit requestMethod: "+requestMethod);

		return null;

	}

}
