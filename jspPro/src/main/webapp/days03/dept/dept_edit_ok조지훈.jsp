<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%

int deptno = Integer.parseInt( request.getParameter("deptno") );
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

Connection conn = null;
PreparedStatement  pstmt = null;

conn = DBConn.getConnection();

String sql = """
      UPDATE dept
      SET dname = ? , loc = ?
      WHERE deptno = ?
      """;

int rowCount = 0;

try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, dname);
   pstmt.setString(2, loc);
   pstmt.setInt(3, deptno);
   rowCount = pstmt.executeUpdate();   
   
   if (rowCount == 1) {
 %>	
		<script>
			alert("<%= deptno %>번 부서 수정저장 완료!");
			location.href = "dept_view.jsp?deptno=<%= deptno %>";
		</script>
	<!-- 	String location = "dept_list.jsp"
		response.sendRedirect(location); -->
<%
   } else{
%>
		<script>
			alert("부서 수정 실패!");
			history.back();
		</script>
<%	   
   	}
   
} catch(SQLIntegrityConstraintViolationException e){
%>
<script>
	alert(" 존재하지 않는 부서번호 입니다. ");
	history.back();
</script>
<%

} catch (SQLException e) {
%>
	<script>
		alert("부서 수정 실패!!");
		history.back();
	</script>
<%
   e.printStackTrace();
} finally {
   try {            
      pstmt.close();
      DBConn.close();
   } catch (SQLException e) { 
      e.printStackTrace();
   }
} 
%>






















