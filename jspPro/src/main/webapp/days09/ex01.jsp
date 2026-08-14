<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 9:41:47</title>
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
   days09.ex01.jsp
   회원테이블 생성
   membger:seq, id, name , passwd role, 
   p250 표현언어 EL 정리
   
   EL z쿠키
  </xmp>
  
  <%
  	Cookie cookie = Cookies.createCookie("user", "admin");
  	response.addCookie(cookie);
  	cookie = Cookies.createCookie("age", "20");
  	response.addCookie(cookie);
  	cookie = Cookies.createCookie("addr", "seoul");
  	response.addCookie(cookie);
  %>
  
  <a href="ex01_ok.jsp">ex01_ok.jsp</a>
</div>
<script>
</script>
</body>
</html>