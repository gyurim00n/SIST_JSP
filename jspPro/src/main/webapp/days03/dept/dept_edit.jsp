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
       
   }//if
   else{
	   %>
	   <script>
	   alert("존재하지 않는 부서입니다!");
	   location.href = "dept_list.jsp";
	   </script>
	   <%
	   return ;
	   
   }//else


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
   부서 수정(dept_edit);
  </xmp>
  
  <h2>부서 수정</h2>
  <form action="dept_edit_ok.jsp" method="post" onsubmit="return checkForm();">
 <table class="vertical">
 		 <caption><p class="validateTips">All form fields are required.</p></caption>
 				
 				<tr>
 					<th>부서번호</th>
 						<td><input type="text" id="deptno" name="deptno" value= "<%=deptno%>" autofocus="autofocus" readonly/></td>
 					
 				</tr>
 				<tr>
 					<th>부서이름</th>
 						<td><input type="text" id="dname" name="dname"  class="long" value= "<%=dname%>"/></td>

 				</tr>
 				<tr>
 					<th>지역명</th>
 						<td><input type="text" id="loc" name="loc"  class="long" value= "<%=loc%>"/></td>
 				</tr>
 				<th></th>
 				<td>
 					<div class="btn_area group">
	 					<!-- <button class="list">목록</button> -->
	 					<button  type="submit"	 class="edit">저장</button>
	 					<button  type="button"  class="cancel">취소</button>
 					</div>
 				</td>
 		</table>
 	</form>
</div>

<script>
$(".btn_area button.cancel").on("click", function(){
	location.href = `dept_view.jsp?deptno=<%=deptno%>`;
})
</script>

<script>

	var deptno = $("#deptno"), dname = $("#dname"), loc = $("#loc"), allFields = $(
			[]).add(deptno).add(dname).add(loc), tips = $(".validateTips");

	function updateTips(t) {
		tips.text(t).addClass("ui-state-highlight");
		setTimeout(function() {
			tips.removeClass("ui-state-highlight", 1500);
		}, 500);
	};
	function checkLength(o, n, min, max) {
		if (o.val().length > max || o.val().length < min) {
			o.addClass("ui-state-error");
			updateTips("Length of " + n + " must be between " + min + " and "
					+ max + ".");
			return false;
		} else {
			return true;
		}
	};
	function checkForm() {
		var valid = true;
		allFields.removeClass("ui-state-error");

		valid = valid && checkLength(deptno, "deptno", 2, 2);
		valid = valid && checkLength(dname, "dname", 3, 14);
		valid = valid && checkLength(loc, "loc", 3, 13);
		console.log(valid);
		return valid;
	};
</script>


</body>
</html>