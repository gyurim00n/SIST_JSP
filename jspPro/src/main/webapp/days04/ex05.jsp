<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 7. 오전 11:44:25</title>
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
   select 부서 정보 + 옵션을 선택.... -> 사원정보를 출력....
   days01.ex05 jsp
   days01.ex05_02 jsp
   
   days02.ex04.jsp 
   프젝은 모델2방식 중 (MVC) 패턴...(유지보수에 좋다.)
   
   days0105
   jsp = 로직 자바 코딩 + 화면 출력(html)
   모델(model).java(로직처리.)+뷰(view)
   
   /dept 요청url ->서블릿 		dept.jsp
   				  포워딩->		출력.
   				  
   1)http://localhost/scott.dept
   2)ScottDept.java 서블릿 클래스
   3)http://localhost/scott/emp 요청 + 30
   4) ScottEmp.java 서블릿 클래스
   포워딩
   5) /days04/ex05_emp.jsp
  </xmp> 
  <!-- http://localhost/scott/dept -->
  <a href = "${pageContext.request.contextPath}/scott/dept">부서정보</a>
</div>
<script>
</script>
</body>
</html>