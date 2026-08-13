<%@page import="java.util.function.Consumer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
    // ?deptno=20
   String  pDeptno = request.getParameter("deptno");    
%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null; 
   ResultSet  rs   = null; 
   ArrayList<DeptVO> dlist = null;
   DeptVO dvo = null;
   Iterator<DeptVO> dir = null;
      
   conn = DBConn.getConnection();
 
   String dsql = """
               SELECT *
               FROM dept
               ORDER BY deptno ASC
           """;
       
   try {
      pstmt = conn.prepareStatement(dsql);
      rs = pstmt.executeQuery();
      
      int deptno;
      String dname, loc;
      
      if ( rs.next()  ) {   
         dlist = new ArrayList<DeptVO>();
         do {
            deptno = rs.getInt("deptno");
            dname = rs.getString("dname");
            loc = rs.getString("loc");
            
            dvo = DeptVO.builder()
                     .deptno(deptno)
                     .dname(dname)
                     .loc(loc)
                     .build();
   
            dlist.add(dvo);
         } while (rs.next() );
      } // if
      
   } catch (SQLException e) {
      e.printStackTrace();
   } finally {
      try {
         rs.close();
         pstmt.close();
      } catch (SQLException e) { 
         e.printStackTrace();
      }
   }
%>
<%
    // http://localhost/days01/ex05_02.jsp?deptno=20
    // JSP 기본 내장 객체 9개 : out, request
    int deptno ; 
   
   ArrayList<EmpVO> elist = null;
   EmpVO evo = null;
   Iterator<EmpVO> eir = null;
      
   String sql = """
               SELECT empno, ename, job, mgr
                 , TO_CHAR( hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno
               FROM emp
               WHERE deptno IN ( %d )
               ORDER BY deptno ASC
              """.formatted(  );
   
   out.print(sql);
   
   try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      // Alt + Shift + A
      int empno;
      String ename;
      String job;
      int mgr;
      LocalDateTime hiredate;  
      double sal;
      double comm;
      // int deptno;
      
      if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
         elist = new ArrayList<EmpVO>();
         do {
            empno = rs.getInt("empno");
            ename = rs.getString("ename");
            job = rs.getString("job");
            mgr = rs.getInt("mgr"); 
            hiredate = rs.getDate("hiredate").toLocalDate().atStartOfDay();    
            sal = rs.getDouble("sal");
            comm = rs.getDouble("comm");
            deptno = rs.getInt("deptno");
             
            evo = EmpVO.builder()
                     .empno(empno)
                     .ename(ename)
                     .job(job)
                     .mgr(mgr)
                     .hiredate(hiredate)
                     .sal(sal)
                     .comm(comm)
                     .deptno(deptno)
                     .build(); 
            elist.add(evo);
         } while (rs.next() );
      } // if 
      
   } catch (SQLException e) {
      e.printStackTrace();
   } finally {
      try {
         rs.close();
         pstmt.close(); 
         DBConn.close();
      } catch (SQLException e) { 
         e.printStackTrace();
      }
   }   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오후 4:06:20</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
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
  
  <select id="deptno" name="deptno">
    <%
      dir = dlist.iterator();
      while( dir.hasNext() ){
         dvo = dir.next();
         deptno = dvo.getDeptno();
         String dname = dvo.getDname();
    %>
    <option value="<%= deptno%>"><%= dname %></option>
    <%     
      } // while
    %>
  </select>
  
</div>
<script>
</script>
</body>
</html>