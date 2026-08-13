<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 10:03:30</title>
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
   days06.ex01.jsp
   p 132 JSP 기본객체와 영역(scope)
   1) page 스코프					pageContext 기본 객체...
   2) request 스코프				request 기본객체
   3) session 스코프				session 기본 객체
   4) application tmzhvm 		application 기본 객체..
   
   setAttribute()
   getAttribute()					
   removeAttribute()
   getAttributeNames()
   
   세션.setattribute("loginUser", "홍")
   세션.setattribute("Auth", "admin")//user. manager
   
   hong = session.getAttribute("loginUser") //저장된 모든 이름...
   
  </xmp>
</div>
<script>
</script>
</body>
</html>