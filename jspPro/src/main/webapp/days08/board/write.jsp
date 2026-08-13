<%@ include file="/WEB-INF/inc/sessionInc.jspf" %>
<% 
	if(loginUser == null){
		out.print("<script>");
		out.print("alert('로그인 필수!!');");
		out.print("location.href='/days07/ex02_default.jsp'");
		out.print("</script>");
		return ; //jsp 에 의해 서블릿이 만들어진다.. 밑에거 더이상 진행하지 않겠다.
		
	}//if
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 11:47:19</title>
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
   글쓰기
  </xmp>
</div>
<script>
</script>
</body>
</html>