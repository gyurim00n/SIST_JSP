<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%@ taglib uri="jakarta.tags.sql"  prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 10:28:31</title>
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
   p292 JSTL 
  </xmp>
  
  <<sql:query var="rs" dataSource="jdbc/myoracle">
  	SELECT deptno, dname, loc
  	From dept
  </sql:query>
  <!--이 방법을 잘 쓰진 안흔다  -->
  <c:forEach items="${rs.rows}" var="dvo">
  	<li>${dvo.deptno} / ${dvo.dname} / ${loc }</li>
  </c:forEach> 
</div>
<script>
</script>
</body>
</html>