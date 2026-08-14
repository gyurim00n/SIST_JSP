<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%@ taglib uri="jakarta.tags.functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오후 12:14:47</title>
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
   ex03_07
   
   JSTL에서는 EL에서 사용하는 함수들을 제공.. p333
  </xmp>
  
  <%
  	String message = "<h3>Hello World</h3>";
  	
  %>
  <c:set value="<%=message %>" var="msg"></c:set>
  
  <li>${msg}</li>
  <li>${fn:escapeXml(msg)}</li>
  <li>${fn:length(msg)}</li>
  <li>${fn:toUpperCase(msg)}</li>
  <li>${fn:substring(msg , 1,4)}</li>
</div>
<script>
</script>
</body>
</html>