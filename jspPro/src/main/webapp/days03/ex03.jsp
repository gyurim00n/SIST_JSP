<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 11:50:52</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/cdn-main/example.css">
<script src="${pageContext.request.contextPath}/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/SiSt.ico">
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
   p74 
   JSP 구성 요소 중 JSP 기본 내장 객체 (9가지)
   1) request 객체
   
   http://localhost/jspPro/days03/ex03.jsp
  </xmp>
  
  클라이언트IP <%= request.getRemoteAddr() %> <br />
  요청정보길이 <%= request.getContentLength() %> <br />
  요청정보 인코딩 <%= request.getCharacterEncoding() %> <br />
  요청정보 컨텐츠타입 <%= request.getContentType() %> <br />
  요청정보 프로토콜 <%= request.getProtocol() %> <br />
  요청정보 전송방식 <%= request.getMethod() %> <br />
  요청 URI <%= request.getRequestURI() %> <br />
 컨텍스트경로<%= request.getContextPath() %> <br />
  서버이름 <%= request.getServerName() %> <br />
  서버포트 <%= request.getServerPort() %> <br />

 <h3>EL로 표현</h3>
 *** 1. contextPath(컨텍스트 루트) : ${pageContext.request.contextPath}<br>
 *** 2. 클라이언트 IP 주소 : ${pageContext.request.remoteAddr}<br>
 *** 3. 요청 전송 방식 : ${pageContext.request.method}<br>
 *** 4. 요청 URL : ${pageContext.request.requestURL}<br>
 *** 5. 요청 URI : ${pageContext.request.requestURI}<br> 

</div>
<script>
</script>
</body>
</html>