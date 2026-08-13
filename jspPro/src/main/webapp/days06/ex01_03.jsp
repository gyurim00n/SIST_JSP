<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 10:27:57</title>
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
   ex01_03.jsp
   page request session application 4가지 스코프를 차례대로 뒤진다.
  </xmp>
  
  >p name: <%=pageContext.getAttribute("name") %><br><!-- 페이지가 바뀌어서 null -->
  >r name: <%=request.getAttribute("age") %><br><!-- 새로운 요청 생겨서 (02->02에서 요청, a링크 클릭해서 02에서 03 요청)null  -->
  >s name: <%=session.getAttribute("addr") %><br>
  >a name: <%=application.getAttribute("tel") %><br>
  
  <hr>
  <!--EL 수정 -jsp 4가지 영역을 순서대로 찾느다 -->
    >p name: ${pageScope.name} <br>
  >r name: ${requestScope.age} <br>
  >s name: ${sessionScope.addr} <br>
  >a name: ${applicationScope.tel} <br>
  <hr>
  <!--EL 수정 -->
    >p name: ${name} <br>
  >r name: ${age} <br>
  >s name: ${addr} <br>
  >a name: ${tel} <br>
  
</div>
<script>
</script>
</body>
</html>