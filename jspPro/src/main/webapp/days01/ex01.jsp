<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// 스크립트릿(Scriptlet) -자바 코딩
	Date now = new Date();
	//  2026-08-04 11:15:07
	String pattern = "yyyy-MM-dd hh:mm:ss ";
	SimpleDateFormat sdf  = new SimpleDateFormat(pattern);
	String strNow = sdf.format(now);
	System.out.printf("😍 strNow: %s\n", strNow);
	//jsp 페이지에 출력: JSP가 제공하는 기본 객체 9개 중 out 개체.
	//500 뜨면 자바코딩오류 
	//
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 4. 오전 10:45:45</title>
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
   ex01.jsp - 동적페이지
   [JSP]
   -Java Server Pages
   JSP는 서버에서 Java 코드를 실행하여 사용자에게 보여줄 HTML을 동적으로 만들어 주는 기술입니다.
   %퍼센트 붙은 건 자바코딩
   @골뱅이는 지시자. jsp에 대한 정보를 나타낸다.
   -JSP 구성 요소 중 스크립트 3가지 종류:
   1) 스크립트릿(Scriptlet)
   2)표현식(Expression) =을 붙인다.
   3)선언문(Declaration)
   
   스크립트릿이 여러데 나눠져있어도 하나. 그래서 변수사용 가능.
  </xmp>
   <h3> out 현재 날짜 + 시간: <% out.println(strNow); %> 서버시계 기준.</h3>
   <h3> 표현식 현재 날짜 + 시간: <%=strNow %></h3>
   <h3> js 현재 날짜 + 시간: <span id="now"></span></h3>
</div>
<script>
let now = '<%= strNow%>';  
//코딩 자체가 넘어와서 클라이언트에서 실행됨.
// 반드시 문자열화. 쌍따옴표 아님 홀따옴표 
$("#now").html(now);
</script>
</body>
</html>