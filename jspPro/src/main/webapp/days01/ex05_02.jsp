<%@page import="java.util.Iterator"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

//http://localhost/days01/ex05_02.jsp?deptno=20
//JSP 기본 내장 객체 9개: out, request
int deptno = Integer.parseInt(request.getParameter("deptno"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<EmpVO> list = null;
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
      list = new ArrayList<EmpVO>();
      
      do {
         empno = rs.getInt("empno");
         ename = rs.getString("ename");
         job = rs.getString("job");
         mgr = rs.getInt("mgr");            
         sal = rs.getDouble("sal");
         comm = rs.getDouble("comm");
         //deptno = rs.getInt("deptno");
//         hiredate = rs.getString("hiredate");
         hiredate = rs.getDate("hiredate").toLocalDate().atStartOfDay();   
         // LocalDate -> LocalDateTime 변환
//         hd.atStartOfDay(); == hd.atTime(0, 0, 0);
         
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
         
         list.add(vo);
         
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오후 4:29:56</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   emp 사원 정보 조회해서 table 생성하기...
  </xmp>
  
  <h3>emp list</h3>
  <table>
  <thead>
  	<tr>     
      <th>empno</th>
      <th>ename</th>
      <th>job</th>
      <th>mgr</th>
      <th>hiredate</th>
      <th>sal</th>
      <th>comm</th>
      <th>deptno</th>
     </tr> 
   </thead>
  	<tbody>
  	<% if(list == null){
  		%><<tr><td colspan="8">사원이 존재하지 않습니다.</td></tr><%
  	}else{
  		ir = list.iterator();
  		while(ir.hasNext()){
  			vo = ir.next();
  			%>
  			<tr>
  				<td><%= vo.getEmpno() %></td>
  				<td><%= vo.getEname() %></td>
  				<td><%= vo.getJob() %></td>
  				<td><%= vo.getMgr() %></td>
  				<td><%= vo.getHiredate() %></td>
  				<td><%= vo.getSal() %></td>
  				<td><%= vo.getComm() %></td>
  				<td><%= vo.getDeptno() %></td>
  			</tr>
  			<%
  		}
  		
  	}
  	%>
  	
  	</tbody>
  	<tfoot>
  	<tr>
  		<td colspan="8"><span class="badge left red"><%= list == null ? 0 : list.size() %>명</span>
  		<a href="javascript:history.back()">뒤로 가기</a>
  		</td>
  	</tr>
  	</tfoot>
  </table>
</div>
<script>
</script>
</body>
</html>