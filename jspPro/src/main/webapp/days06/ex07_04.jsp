<%@page import="java.util.Date"%>
<%@page import="days06.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 4:14:51</title>
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
   ex07_04.jsp
   
   jsp:useBean 액션 태그를 사용해서 자바빈 객체 생성해서 사용한 예제
  </xmp>
  
  <%
  	String id= request.getParameter("id");
  	String name= request.getParameter("name");
  	String passwd= request.getParameter("passwd");
  	String email= request.getParameter("email");
  	
  %>
  <jsp:useBean id="member" scope="page" class="days06.Member">  </jsp:useBean>
  <jsp:setProperty property="id" name="member" value="<%= id %>"></jsp:setProperty>
  <jsp:setProperty property="name" name="member" value="<%= name %>"></jsp:setProperty>
  <jsp:setProperty property="passwd" name="member" value="<%= passwd %>"></jsp:setProperty>
  <jsp:setProperty property="email" name="member" value="<%= email %>"></jsp:setProperty>
  <jsp:setProperty property="registerDate" name="member" value="<%= new Date() %>"></jsp:setProperty>

  
  
  아이디 	: <jsp:getProperty property="id" name="member"/> <br />
  이름 	: <jsp:getProperty property="name" name="member"/> <br />
  비밀번호 : <%= member.getPasswd() %> <br />
  이메일 : <%= member.getEmail() %> <br />
  등록일 : <%= member.getRegisterDate() %> <br />
  
</div>
<script>
</script>
</body>
</html>