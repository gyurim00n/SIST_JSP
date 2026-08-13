package days07.mvc.member.command;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import days07.mvc.board.command.CommandHandler;
import days07.mvc.member.domain.MemberDTO;
import days07.mvc.member.persistence.MemberDAO;
import days07.mvc.member.persistence.MemberDAOImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.로직 처리
		System.out.println("> View Handler 07.process() ...");
		
		long seq = Long.parseLong(request.getParameter("seq"));
		  
		//1.a목록로직처리
		Connection conn = ConnectionProvider.getConnection();
		MemberDTO mto = null;
		MemberDAO mao = new MemberDAOImpl(conn);
		int rowCount =0;
		try {
			conn.setAutoCommit(false);
			
		
	
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
		
		request.setAttribute("mto", mto);
		
	
		return "/WEB-INF/views/days07/board/view.jsp";
	}

}
