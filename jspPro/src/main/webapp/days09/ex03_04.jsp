<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%@ taglib uri="jakarta.tags.functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오전 11:13:30</title>
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
   
  </xmp>
  <!--for(int i=1; i<=10; i++)  -->
 <c:forEach begin="1" end="10" step="1" var="i" varStatus="vs">
  	${i}  / ${vs.index } / ${vs.count} / ${vs.first} / ${vs.last} <br>
  </c:forEach>

<h2>1+2+3. . . = 55 forEach 사용</h2> <br>

<c:set var="sum" value="${0}" />

<c:forEach begin="1" end="10" step="1" var="i">
    <c:set var="sum" value="${sum + i}" />
    ${i} 
    <%-- ${i eq 10 ? "=" : "+"} --%>
   <c:if test= "${i ne 10}">+</c:if>
</c:forEach>
=${sum}


<hr>

<c:set var="sum" value="${0}" />
<c:forEach begin="1" end="10" step="1" var="i">
${i += (vs.last ? "=" : "+")  }
    <c:set var="sum" value="${sum + i}" />
</c:forEach>
${sum}

<hr />
<c:set value="홍길동,서영학,정창기" var="names"></c:set>
<c:forTokens items="${names}" delims="," var="name">
	<li>${name}</li>
</c:forTokens>

<hr />

<h2>c:out JspWriter 출력</h2>

<c:set var="msg" value="<h3>Hello World!</h3> <br />홍길동 <br />" />

<p id="demo">
    ${msg}<br />
    <c:out value="${msg}" /><br>
    <c:out value="${msg}" escapeXml="false"/><br>
</p>
</div>
<script>
</script>
</body>
</html>