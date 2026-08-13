<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%

//삭제할 부서번호
int deptno = Integer.parseInt(request.getParameter("deptno"));

      Connection conn = null;
      PreparedStatement  pstmt = null;
      
      conn = DBConn.getConnection();
      
      String sql = """
            DELETE FROM dept 
            WHERE deptno = ?
            		""";
      
      int rowCount = 0;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, deptno);

         rowCount = pstmt.executeUpdate();   
         
         if (rowCount == 1) {
        	 //부서 목록 페이지로 이동.
        	%> <script>alert("부서 삭제 성공: ");
        	location.href =  "dept_list.jsp";</script>
        	<% 
        	/*  String location = "dept_list.jsp";
        	 response.sendRedirect(location); //여기 페이지로 이동한다. */
        	 
         }else{
        	 %>
       	  <script>
       	  	alert("부서 삭제 실패!!!");
       	  	history.back();
       	  </script>
       	  <%
         }
      }  catch (SQLException e) {
    	  %>
    	  <script>
    	  	alert("부서 삭제 실패!!!");
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