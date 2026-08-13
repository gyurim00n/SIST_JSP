package days04;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.doit.domain.DeptVO;

import com.util.DBConn;


@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ScottDept() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1. 부서정보 조회 로직 처리...
		System.out.println("> ScottDept.doGet()...");
	
		Connection conn = null;
		PreparedStatement pstmt = null; // SQL 실행하는 객체
		ResultSet rs = null; // 실행 결과를 저장하는 객체
		ArrayList<DeptVO> list = null;
		DeptVO vo = null;
		Iterator<DeptVO> ir = null;

		// 1 + 2
		conn = DBConn.getConnection();

		// 3. sql작성->stmt sql실행-> rs -> ArrayList 저장 -> 출력
		//String sql = "SELECT * "
//		        + " FROM dept "
//		        + " ORDER BY deptno ASC";
		// Java 15 이상: 텍스트블럭 
		String sql =   """
		Select *
		FROM dept 
		ORDER BY deptno ASC
		""";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int deptno;
			String dname, loc;

			if (rs.next()) { // 첫 번째 레코드는 존재한다.
				list = new ArrayList<DeptVO>();
				do {
			deptno = rs.getInt("deptno");
			dname = rs.getString("dname");
			loc = rs.getString("loc");
			//         vo = new DeptVO(deptno, dname, loc);
			vo = DeptVO.builder().deptno(deptno).dname(dname).loc(loc).build();

			//         System.out.println( vo );
			list.add(vo);
				} while (rs.next());
			} // if

			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				// 4
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//System.out.println("😍😊😘" + list.size());
		//2.포워딩
		request.setAttribute("list", list); //넘겨줄때 리스트도 함게 넣는단는뜻.
		
		String path = "/days04/ex05_dept.jsp";//context path까진 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
