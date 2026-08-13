<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오후 2:44:32</title>
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
   p516~525
   
   ex04.jsp
   http://localhost/cstvsboard/view.htn?seq=10& 파라미터 계속 붙이기..
   
   [MVC] 패턴 실습
   1. 패키지 먼저 선언...
   days07.mvc.board.controller 		패키지 : MV[C]
   days07.mvc.board.command 		패키지 : [M]VC Command Handler
   	ㄴ요청을 처리하는 모델 객체
   	ㄴCommandHandler.java 인터페이스 구현 
   	String process(request, response)
   	뷰 결과물 session/request 저장
   days07.mvc.board.domain 			패키지 : DTO, VO , 자바빈 
   days07.mvc.board.persistence 	패키지:DAO 
   days07.mvc.board.service 		패키지:서비스 
   
   요청URL => CommandHandler /WEB-INF/commandHandler.properties 파일 ( 업무 담당자 목록 리스트)
   
   MV[C] 컨트롤러 작성:			DispatcherServlet (분배하다)
    
  </xmp>
</div>
<script>
</script>
</body>
</html>