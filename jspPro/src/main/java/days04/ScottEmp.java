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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;

import org.doit.domain.DeptVO;
import org.doit.domain.EmpVO;

import com.util.DBConn;


@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ScottEmp() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1. 부서정보 조회 로직 처리...
		System.out.println("> ScottEmp.doGet()...");

		//System.out.println("😍😊😘" + list.size());
		//2.포워딩
		int deptno = Integer.parseInt(request.getParameter("deptno"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EmpVO> elist = null;
		EmpVO vo = null;
		Iterator<EmpVO>ir = null;

		conn = DBConn.getConnection();

		String sql = """
		      SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno 
		      FROM emp
		      Where deptno = %d
		      ORDER BY deptno ASC
		      """.formatted(deptno);

		try {
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery();
		   
		   int empno,mgr;
		   double sal,comm;
		   String ename,job;
		   LocalDateTime hiredate;
		   
		   if ( rs.next() ) {
		      elist = new ArrayList<EmpVO>();
		      
		      do {
		         empno = rs.getInt("empno");
		         ename = rs.getString("ename");
		         job = rs.getString("job");
		         mgr = rs.getInt("mgr");            
		         sal = rs.getDouble("sal");
		         comm = rs.getDouble("comm");
		         //deptno = rs.getInt("deptno");
//		         hiredate = rs.getString("hiredate");
		         hiredate = rs.getDate("hiredate").toLocalDate().atStartOfDay();   
		         // LocalDate -> LocalDateTime 변환
//		         hd.atStartOfDay(); == hd.atTime(0, 0, 0);
		         
		         vo = EmpVO.builder()
		               .empno(empno)
		               .ename(ename)
		               .job(job)
		               .mgr(mgr)
		               .hiredate(hiredate)
		               .sal(sal)
		               .comm(comm)
		               .deptno(deptno)
		               .build();
		         
		         elist.add(vo);
		         
		      } while ( rs.next() );
		   
		   } // if
		   
		   //dispEmpInfo(list);
		   
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   try {
		      rs.close();
		      pstmt.close();
		      DBConn.close();
		   } catch(SQLException e){
		      e.printStackTrace();
		   }
		}
		request.setAttribute("elist", elist); //넘겨줄때 리스트도 함게 넣는단는뜻.
		
		String path = "/days04/ex05_emp.jsp";//context path까진 들어왓다..
		RequestDispatcher dispatcher= request.getRequestDispatcher(path);
		dispatcher.forward(request, response); //request 유지됨  리다이렉트는 유지 안됨.
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
