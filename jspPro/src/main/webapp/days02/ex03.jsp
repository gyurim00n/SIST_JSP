<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오후 12:37:24</title>
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
   서블릿(Servlet)
   498 검색.
   1. 서블릿 규약에 따라 자바 코드를 작성한다.
                 1) 서블릿 규약
               (ㄱ) 접근지정자 public 
               (ㄴ) javax.servlet.http.HttpServlet 클래스 상속
               (ㄷ) service(), get(), post() 메서드를 오버라이딩.
               days02 ->> Now.java
               <%
               //jspwriter out JSP 기본 내장 객체 9개 중 출력(응답)
               out.write("admin"); %>
	2. 자바 코드를 컴파일해서 클래스 파일을 생성한다.
	3. 클래스 파일을 /WEB-INF/classes 폴더에 패키지에 알맞게 위치시킨다.
	4. web.xml 파일에 서블릿 클래스를 설정한다.
	5. 톰캣 등의 컨테이너를 실행한다.
	6. 웹 브라우저에서 확인한다.
  </xmp>
  <!--urlPatterns = { 
				"/hello", 
				"*.hi", 
				"/sample/greeting/*"
		})
		  -->
  <a href="/now.htm">now.htm</a>
  <br />
  <a href="/days02/servlet/now">/days02/servlet/now</a>
  <br />
  <a href="/days02/servlet/now">/days02/sample/a.jsp</a>
  <br />
  <a href="/days02/servlet/now">/days02/sample/b.html</a>
  <br />
  <a href="/days02/servlet/now">/days02/sample/c.php</a>
  <br />
  
	<a href="/hello?Name=홍길동">/hello</a>
	<br />
	<a href="/test/sample/a.hi">test/sample/a.hi?Name=홍길동</a>
	<br />
	<a href="b.hi">b.hi?Name=홍길동</a>
	<br />
	<a href="/sample/greeting/test/x.jsp">/sample/greeting/test/x.jsp?Name=홍길동</a>
	<br />
	<a href="/sample/greeting/yy.jsp">sample/greeting/yy.jsp?Name=홍길동</a>
	<br />

 <a href="/foo/bar/index.html">/foo/bar/index.html</a>  <br>
  <a href="/foo/bar/index.bop">/foo/bar/index.bop</a>  <br>
  <a href="/baz">/baz</a>  <br>
  <a href="/baz/index.html">/baz/index.html</a>  <br>
  <a href="/catalog">/catalog</a>  <br>
  <a href="/catalog/racecar.bop">/catalog/racecar.bop</a>  <br>
  <a href="/index.bop">/index.bop</a>  <br>
  <hr>
</div>
<script>
</script>
</body>
</html>