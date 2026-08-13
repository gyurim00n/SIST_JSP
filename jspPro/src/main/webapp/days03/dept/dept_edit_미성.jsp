<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@page import="java.sql.Connection"%>
<%
	int deptno = Integer.parseInt(request.getParameter("deptno"));

	Connection conn = null;
	PreparedStatement pstmt = null;  
	ResultSet rs   = null;  
	String dname = null, loc = null;
	
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
	
	   if ( rs.next()  ) { 
	         deptno = rs.getInt("deptno");
	         dname = rs.getString("dname");
	         loc = rs.getString("loc"); 
	   } else {
%>
		<script>
		  alert("부서를 찾을 수 없음");
		  location.href = "dept_list.jsp";
		</script>
<%
		 return;
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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[JSP] 2026. 8. 6. 오후 3:34:12</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div class="container">
  <xmp class="code">
  
  
  
  </xmp>
  
  <h2>수정</h2>
  
  <form action="dept_edit_ok.jsp" method="post" onsubmit="return checkForm();">
	  <table class="vertical">
	      <cation>
	        <p class="validateTips">All form fields are required.</p>
	      </cation>
	        <tr>
	          <th>부서번호</th>
	          <td><input type="text" id="deptno" name="deptno" value="<%= deptno %>" class="long" readonly="readonly"></td>
	        </tr>
	        <tr>
	          <th>부서명</th>
	          <td><input type="text" id="dname" name="dname" value="<%= dname %>" class="long"></td>
	        </tr>
	        <tr>
	          <th>지역명</th>
	          <td><input type="text" id="loc" name="loc" value="<%= loc %>" class="long"></td>
	        </tr>
	        <tr>
	          <th></th>
	          <td>
	            <div class="btn-area group">
	              <button class="add">저장</button>
	              <button class="cancle">취소</button>              
	    		</div>
	          </td>
	        </tr>
	    </table>
  </form>
</div>
<script>

  $(".btn-area button.cancle").on("click", function () {
	  event.preventDefault();
	  history.back();	
  });
  
</script>
<script>
  var deptno = $("#deptno"),
	  dname = $("#dname"),
	  loc = $("#loc"),
	  allFields = $( [] ).add( deptno ).add( dname ).add( loc ),
      tips = $( ".validateTips" );;
  
  function updateTips( t ) {
	tips
	  .text( t )
	  .addClass( "ui-state-highlight" );
	setTimeout(function() {
	  tips.removeClass( "ui-state-highlight", 1500 );
	}, 500 );
  }
  
  function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
  
  function checkForm() {
    var valid = true;
    allFields.removeClass( "ui-state-error" );
 	
    valid = valid && checkLength( deptno, "deptno", 2, 2 );
    valid = valid && checkLength( dname, "dname", 2, 14 );
    valid = valid && checkLength( loc, "loc", 3, 13 );
  
    return valid;
  }
  
</script>
</body>
</html>