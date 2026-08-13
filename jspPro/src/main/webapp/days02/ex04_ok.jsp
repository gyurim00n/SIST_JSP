<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>

<% 
	//http://localhost/days02/ex04_ok.jsp?empno=7782&empno=7839
	String[] empnos = request.getParameterValues("empno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오후 5:37:46</title>
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
   ex04_ok.jsp
   
   ex04_02에서 받아온 사원번호 리스트로 출력.
   
   Tomcat 10.1.x + JDK 21 환경에서는 기존 javax.servlet.jsp.jstl이 아니라 Jakarta JSTL 3.x를 사용해야 합니다.

	1. 다운로드해야 하는 파일
	
	다음 두 개의 JAR 파일을 다운로드합니다.
	
	파일명   역할   필요 여부
	jakarta.servlet.jsp.jstl-api-3.0.2.jar   JSTL API (인터페이스)   필수
	jakarta.servlet.jsp.jstl-3.0.1.jar   JSTL 구현체(Implementation)   필수
  </xmp>
<%--   <ul>
  <%
  	for(int i = 0; i< empnos.length; i++){
   %>
   <li><%= empnos[i] %></li>
   <%
  	}
  	%>
  </ul> --%>
  
  
  <h3>
  JSTL 사용 처리!
  </h3>
  <ol>
  <c:forEach items = "<%=empnos %>" var="eno">
  	<li>${eno}</li>
  </c:forEach>
  </ol>
  
</div>
<script>
</script>
</body>
</html>