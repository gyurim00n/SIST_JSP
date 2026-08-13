<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오후 2:02:11</title>
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
  p170 include 지시자: 중복 코딩.. 처리
  WEB-INF -> inc 폴더 추가 
  				ㄴcookieInc.jspf
  			ex02_default.jsp 	공통 자바 코딩
  			board/list.jsp 		공통 자바 코딩
  			board/writer.jsp	공통 자바 코딩
  			
   ex03.jsp
   p416 커넥션 풀(Connection pool) db연동시 사용
   p425 커넥션 풀의 속성 표로 정리
   	META-INF 폴더 안에 context.xml 넣어도 되는 이유:
   	ㄴ톰캣에서 META-INF/context.xml을 자동으로 인식.
   	ㄴ웹 애플리케이션의 표준 디렉토리
   	ㄴcontext 의미 : 톰캣에서 실행되는 하나의 웹 애플리케이션(사이트)
	
	com.util.ConnectionProvider.java
	
  </xmp>
  <%
 /*  Context initContext = new InitialContext();
  Context envContext  = (Context)initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
  Connection conn = ds.getConnection();
   */
  
  //etc.
  Connection conn = ConnectionProvider.getConnection();
  %>
 >conn: <%=conn  %>
 <%
 	conn.close(); //커넥션풀이 반환.
 %>
</div>
<script>
</script>
</body>
</html>

