<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 9:03:06</title>
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
   ex08_03.jsp
   
   모든 쿠키값을 조회/수정/삭제/생성
  </xmp>
  
 <!--  모든 쿠키값을 조회해서 출력... -->
 <form action="">
 	<%
 	// js:document.cookie 속성
 	Cookie [] cookies = request.getCookies();
 	for(Cookie cookie :cookies){
 		String cName = cookie.getName();
 		String cValue = URLDecoder.decode(cookie.getValue(),"UTF-8");
 		%>
 		<input type="checkbox" name="ckbCookie" value="<%=cName %>"/>
 		<%=cName %> - <%=cValue %>
 		<br />
 		<%
 	}//for
 	%>
 </form>
 <br>
  <a href="ex08.jsp">쿠키 Home</a><br />
  <a href="ex08_02.jsp">쿠키 생성</a><br />
  
  쿠키를 삭제, 수정할 때는 체크한 후에 쿠키 수정<br />
  
  <a href="ex08_04.jsp">쿠키 삭제</a><br /><!--파라미터 값을 여기다 바로 못붙여서, 링크 태그를 클릭해야 폼이 submit 되도록...  -->
  <a href="ex08_05.jsp">쿠키 수정</a><br />
</div>
<script>
//[1] location.href = "?"
		
//[2] form.sumit(); 


$("div a").eq(2).on("click", function(){
	event.preventDefault();
	let url = $(this).attr("href"); //ex08_04
	$("form").attr("action", url).submit();	
})

$("div a").last().on("click", function(){
	event.preventDefault();
	let url = $(this).attr("href"); //ex08_05 //같은 쿠키이름은 덮어써진다 .
	$("form").attr("action", url).submit();	
})
</script>
</body>
</html>