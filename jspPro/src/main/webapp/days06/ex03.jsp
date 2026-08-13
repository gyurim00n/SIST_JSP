<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%@ page buffer="8kb" autoFlush="true"%><!-- 이 위로는 공백으로 뜸 -->
<%@ page trimDirectiveWhitespaces="true" %><!-- 위 공백 다 없애자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 11:40:34</title>
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
   ex03.jsp
   p 152 버퍼와 에러페이지의 관계
  </xmp>
  
  <%
  	for(int i=1 ; i<= 10000; i++){
  		out.print("[" + i + "]");
  		//if(i==2) out.clearBuffer(); //i==2 이전 html 다 날려
  		if(i%10 == 0) out.flush();
  	}
  %>
</div>
<script>
</script>
</body>
</html>