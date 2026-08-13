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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class WriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// ---------------------------------------------------------------
		// 1. [공통 로그인 체크] 세션에 authUser 정보가 없으면 차단
		// ---------------------------------------------------------------
		HttpSession session = request.getSession(false); // 기존 세션 가져옴 (없으면 null)
		AuthUser authUser = (session != null) ? (AuthUser) session.getAttribute("authUser") : null;

		if (authUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("  alert('로그인이 필요한 서비스입니다.');");
			// 메인 페이지 또는 로그인 페이지로 이동 (프로젝트 경로에 맞게 조정)
			out.println("  location.href='" + request.getContextPath() + "/days08/board/ex02_default.jsp';");
			out.println("</script>");
			out.flush();

			// 컨트롤러가 포워딩/리다이렉트를 수행하지 않도록 null 반환
			return null; 
		}

		//doGet, doPost 쓸수 없어서 if문으로 getMethod=GET/ POST 분리
		String requestMethod = request.getMethod();
		System.out.println("❤️❤️❤️ Write requestMethod: "+requestMethod);
		if(requestMethod.equals("GET")){
			String loginUser = authUser.getLoginUser();
			String writer= loginUser;
			String pwd= "";
			String email= "";
			String title= "";
			String content ="";
			int tag =1;

			BoardDTO bDto = BoardDTO.builder()
					.writer(writer)
					.pwd(pwd)
					.email(email)
					.title(title)
					.content(content)
					.tag(tag)
					.build();
			
			request.setAttribute("dto", bDto);
			return "/WEB-INF/views/days07/board/write.jsp";

		}else if(requestMethod.equals("POST")){
			response.setContentType("text/html; charset=UTF-8");

			System.out.println("WriteHandler.process() Post 호출됨...");

			String writer= authUser.getLoginUser();//request.getParameter("writer");
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

			Connection conn = ConnectionProvider.getConnection();
			BoardDAO dao = new BoardDAOImpl(conn);
			int rowCount = 0;

			try {
				int newSeq = dao.getNextSeq();
				bDto.setSeq(newSeq);

				rowCount = dao.insert(bDto);

				if(rowCount ==1) {	//글쓰기 성공
					//String location="/cstvsboard";

					// [2]
					String location = "redirect:" + request.getContextPath()+"/mvc/board/list.htm";
					return location;

					/*
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('"+ newSeq+"번 글쓰기가 완료되었습니다.');");
					out.println("location.href='" + location + "';");
					out.println("</script>");
					 */
					//경고창 띄우고 다시 요청. sendRedirect 사용....

				}else {	//글쓰기 실패
					System.out.println("2. WriteHandler.process() Post글쓰기 실패........");

				}


			} catch (SQLException e) {
				System.out.println(">2. WriteHandler.process() Post Exception....");
				e.printStackTrace();
			} finally {
				conn.close(); //connection pool 커넥션 풀에 반환...
			}

		}
		//글쓰기 실패 또는 GET/POST 이 외의 요청이 들어오다...
		return null;

	}

}
