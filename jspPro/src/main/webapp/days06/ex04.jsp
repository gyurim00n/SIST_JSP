<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오전 11:52:58</title>
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
   ex04.jsp
   p155 페이지 모듈화와 요청 흐름 제어..
   
   1)jsp:include 액션태그
   2)include 지시자
   
         하나의 웹 사이트(애플리케이션)을 구성하는 
      페이지의 상단,하단,메뉴 등등 모든 웹 페이지의     
      공통적인 부분을 모듈화 시켜서 코드의 중복 제거
      생산성 향상, 유지, 보수, 확장성이 용이.
      
      webapp 폴더
         ㄴ layout 폴더 - 상단, 하단 메뉴
               ㄴ top.jsp
               ㄴ bottom.jsp
               
         ㄴ days07 폴더
               ㄴ layout 폴더
                   ㄴ left.jsp
                   ㄴ right.jsp
   
  </xmp>
</div>
<script>
</script>
</body>
</html>