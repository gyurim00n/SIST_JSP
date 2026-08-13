<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 9:40:51</title>
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
   http://localhost/days06/ex08_05_ok.jsp?
   name=%EA%B9%80%EB%80%A8%EB%80%A8
   &animal=cat
  </xmp>
  <%
  Enumeration<String> cnen = request.getParameterNames(); //color, age. . .
  while(cnen.hasMoreElements()){
	  	String cookieName = cnen.nextElement();
		String cookieValue = request.getParameter(cookieName);
		
		Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8")); //여기서 예외 발생. 왜?
		cookie.setMaxAge(-1); // 브라우저 닫으면 쿠키는 자동으로 삭제됨.
		//cookie.setPath("/");
		response.addCookie(cookie);

  }
  
  %>
  
</div>
<script>
	  alert("쿠키 수정 완료 !!! ");
	  location.href = "ex08_03.jsp";
</script>
</body>
</html>