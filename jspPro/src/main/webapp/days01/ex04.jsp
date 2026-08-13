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
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<EmpVO> list = null;
EmpVO vo = null;

conn = DBConn.getConnection();

String sql = """
      SELECT * 
      FROM emp
      ORDER BY empno ASC
      """;

try {
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();
   
   int empno,deptno,mgr;
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
         deptno = rs.getInt("deptno");
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
<title>2026. 8. 4. 오후 3:51:51</title>
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
   
  </xmp>
  <table>
  <tr>
  	<th>EMPNO</th>
  	<th>ENAME</th>
  	<th>JOB</th>
  	<th>MGR</th>
  	<th>HIREDATE</th>
  	<th>SAL</th>
  	<th>COMM</th>
  	<th>DEPTNO</th>
  </tr>
  
  <% 
  if(list != null){
	  for(EmpVO emp : list){
		  int empno = emp.getEmpno();
		  String ename = emp.getEname();
		  String job = emp.getJob();
		  int mgr = emp.getMgr();
		  LocalDateTime hiredate = emp.getHiredate();
		  LocalDate hiredate1 = hiredate.toLocalDate();//String.format(hiredate, "YYYY-MM-DD");
		  double sal = emp.getSal();
		  double comm = emp.getComm();
		  int deptno = emp.getDeptno();
	  
	  %>
	  <tr>
	  	<td><%= emp.getEmpno() %></td> <!--위처럼 변수지정보다 이렇게적는게더나을듯 -->
	  	<td><%= ename %></td>
	  	<td><%= job %></td>
	  	<td><%= mgr %></td>
	  	<td><%= emp.getHiredate().toLocalDate() %></td>
	  	<td><%= sal %></td>
	  	<td><%= comm %></td>
	  	<td><%= deptno %></td>
	  </tr>
	  
	  <% 
	  }
  }
  %>
  </table>
</div>
<script>
</script>
</body>
</html>