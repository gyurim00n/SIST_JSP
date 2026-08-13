<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 10:14:44</title>
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
   	ex01_ok_02.jsp
   	jsp 리퀘스트 객체를 EL에서 가져올려면 pageContext.request.method ....사용 
  </xmp>
   >요청 방식(method): <%= request.getMethod() %>  //요청한게 무엇인지 돌려주는 코드
   <br>
   >요청 방식(method) EL: ${pageContext.request.method }
    <br />
  <hr>
  <% 
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  
  %>
  이름:<%= name %><br>
  나이:<%= age %><br>
  <br>
  이름 EL: ${param.name} <br>
  나이 EL: ${param.age} <br>
  
  <!-- param, pageContext EL 기본 제공하는 객체  -->
  
  <br>
  <a href="javascript:history.back();">뒤로가기</a>
  
</div>
<script>
</script>
</body>
</html>