<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 13. 오전 10:25:13</title>
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
   day07 delete.jsp
  </xmp>
 <h3>게시판삭제 </h3>
 <form action="" method="post">
   	<table>
	   	<tr>
	         <td colspan="2" align="center"><b>삭제하려면 비밀번호를 입력하세요.</b></td>
	      </tr>
	     
	      <tr>
	         <td align="center">비밀번호</td>
	         <td><input type="password" name="pwd" size="15"
	            required="required"></td>
	      </tr>
      	<tr>
         <td colspan="2" align="center">
            <input type="submit"   value="작성 완료"> &nbsp;&nbsp;&nbsp; 
            <a href="${pageContext.request.contextPath}/mvc/board/view.htm?seq=${param.seq}">뒤로 가기</a>
            
         </td>
      	</tr>
   	</table>
   
   </form>
  
</div>
<script>
</script>
</body>
</html>