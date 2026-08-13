package days07.mvc.member.command;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import days07.mvc.board.command.CommandHandler;
import days07.mvc.member.domain.MemberDTO;
import days07.mvc.member.persistence.MemberDAO;
import days07.mvc.member.persistence.MemberDAOImpl;
import days08.AuthUser;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginHandler implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// GET 요청: 로그인 폼 페이지로 이동
        if (request.getMethod().equals("GET")) {
            return "/days08/board/ex02_logon.jsp"; // 뷰(JSP) 경로
        } 
        
        // POST 요청: 로그인 인증 처리
        else if (request.getMethod().equals("POST")) {
            String id = request.getParameter("id");
            String passwd = request.getParameter("passwd");
            
            // 리다이렉트 기본 경로
            String location = request.getContextPath() + "/days08/board/ex02_default.jsp";

            try (Connection conn = ConnectionProvider.getConnection()) {
                MemberDAO dao = new MemberDAOImpl(conn);
                MemberDTO member = dao.login(id, passwd); // DB 조회 (앞서 작성한 login 메서드)

                if (member != null) {
                    // [성공] 세션 얻어와서 AuthUser 저장
                    HttpSession session = request.getSession();
                    session.setAttribute("authUser", new AuthUser(member.getId(), member.getRole()));
                } else {
                    // [실패] 실패 파라미터 추가
                    location += "?on=fail";
                }
            } catch (Exception e) {
                e.printStackTrace();
                location += "?on=fail";
            }

            // Handler에서 직접 redirect 처리 후 null 반환 (또는 Controller 설계 방식에 맞춰 반환)
            response.sendRedirect(location);
            return null;
        }

        return null;
    }

}
