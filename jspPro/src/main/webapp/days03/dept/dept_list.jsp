<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 2:05:06</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<style>
<
style>body {
	font-family: 맑은 고딕;
}

.container {
	width: 700px;
	margin: 30px auto;
}

.btn-area {
	text-align: right;
	margin-bottom: 15px;
}

.btn {
	display: inline-block;
	padding: 8px 15px;
	background: #0d6efd;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.btn:hover {
	background: #0b5ed7;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

th {
	background: #f2f2f2;
}

tr:hover {
	background: #fafafa;
}

a {
	color: #0d6efd;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</style>
</head>

<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">kEnik HOme</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div class="container">
		<xmp class="code"> 부서 목록(dept_list.jsp) </xmp>

		<h2>부서 목록</h2>


		<table>
			<thead>
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>지역명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="<%=dlist %>" var="dvo">
					<tr>
						<td>${dvo.deptno}</td>
						<td> <a href="dept_view.jsp?deptno=${dvo.deptno}">${dvo.dname}</a> </td>
						<td>${dvo.loc}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
				<td colspan="3">
					<!-- 부서추가 버튼  -->
					<div class="btn-area">
						<button class="add">
							부서 추가
					</div>				
				 </td>
					
				</tr>
			</tfoot>
		</table>


	</div>
	<script>

$(".btn-area button.add").on("click", function(){
	location.href = "dept_add.jsp";
})
</script>
</body>
</html>