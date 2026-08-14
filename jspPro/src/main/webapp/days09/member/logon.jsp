<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오후 3:17:13</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
     <c:choose>
    	<c:when test="${ empty sessionScope.authUser.loginUser}"><!--  인증 x -->
    		<a href="/days09/member/logon.jsp">로그인</a>
    	</c:when>
    	<c:otherwise><!--  인증 o -->
    	[${authUser.loginUser} ]<a href="/days09/member/logout.jsp">로그아웃</a>
    	</c:otherwise>
    </c:choose>
  </ul>
</header>
<div>
  <xmp class="code">
   logon
  </xmp>
  <h3>로그인...</h3>
  
   	<div id="logon">
  	<!-- //로그인 하지 않은 경우... -->
  	   <form action="logon_ok.jsp" method="post">
	       아이디 : <input type="text" name="id" value="admin"> <br>
	       비밀번호 :  <input type="password" name="passwd" value="1234"> <br>
	       <input type="submit" value="로그인"> 
	       <input type="reset">     
	       <span style="color:red;display: none">로그인 실패했습니다.</span>    
       </form>
     </div>
     
</div>
<script>
</script>
</body>
</html>