package days07.mvc.board.command;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.board.persistence.BoardDAO;
import days07.mvc.board.persistence.BoardDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//doGet, doPost 쓸수 없어서 if문으로 getMethod=GET/ POST 분리
		String requestMethod = request.getMethod();
		System.out.println("❤️❤️❤️ Write requestMethod: "+requestMethod);
		if(requestMethod.equals("GET")){
			return "/WEB-INF/views/days07/board/write.jsp";
			
		}else if(requestMethod.equals("POST")){
			response.setContentType("text/html; charset=UTF-8");

			System.out.println("WriteHandler.process() Post 호출됨...");

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
