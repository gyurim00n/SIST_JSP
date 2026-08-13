<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
int deptno = Integer.parseInt(request.getParameter("deptno"));


Connection conn = null;
PreparedStatement  pstmt = null;  
ResultSet  rs   = null;  
DeptVO vo = null;
String dname = null, loc=null;

conn = DBConn.getConnection();

String sql = """
       SELECT *
       FROM dept
       WHERE deptno = ?
      """;
try {
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1, deptno);
   rs = pstmt.executeQuery();

   

   if ( rs.next()  ) {  // 첫 번째 레코드는 존재한다.
      
         deptno = rs.getInt("deptno");
         dname = rs.getString("dname");
         loc = rs.getString("loc"); 
       
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

%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 3:34:34</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<style>

</style>
</head>

<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div class="container">
  <xmp class="code">
   부서 상세보기 dept_view.jsp
  </xmp>
  
  <h2>부서 상세보기</h2>
  
  <table class="vertical">
 				<tr>
 					<th>부서번호</th>
 						<td><%= deptno %></td>
 					
 				</tr>
 				<tr>
 					<th>부서이름</th>
 						<td><%= dname %></td>
 					
 				</tr>
 				<tr>
 					<th>지역명</th>
 						<td><%= loc %></td>
 					
 				</tr>
 				<th></th>
 				<td>
 					<div class="btn_area group">
	 					<button class="list">목록</button>
	 					<button class="edit">수정</button>
	 					<button class="delete">삭제</button>
	 					<button class="elist">부서원 목록</button>
 					
 					
 					<%-- <a href="dept_list.jsp" class="btn list">목록</a>
 					<a href="dept_edit.jsp?deptno=<%= deptno %>" class="btn list">수정</a>
 					<a href="dept_delete.jsp?deptno=<%= deptno %>" class="btn delete">삭제</a> --%>
				
 					</div>
 				</td>
 		</table>
</div>
<script>
$(".btn_area button.list").on("click", function(){
	location.href = "dept_list.jsp";
})
$(".btn_area button.edit").on("click", function(){
	location.href = "dept_edit.jsp?deptno=<%= deptno%>";
})
$(".btn_area button.delete").on("click", function(){
	
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = `dept_delete.jsp?deptno=<%= deptno%>`;
	}
	
})
$(".btn_area button.elist").on("click", function(){
	location.href = "emp_list.jsp?deptno=<%= deptno%>";
})

</script>
</body>
</html>