<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오후 2:44:33</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">jIhUn HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>

   <a href="/mvc/board/list.htm">/mvc/board/list.htm</a>

  <xmp class="code">
   p518 ~ p524 MVC 패턴 구현
   
   [MVC 패턴 실습]
   1. 패키지 먼저 선언
      days07.mvc.board.controller 패키지  : MV[C]
      days07.mvc.board.command 패키지    : [M]VC Command Handler
         ㄴ 요청을 처리하는 모델(Model) 객체
         ㄴ CommandHandler.java 인터페이스 구현
            String process(request, response)
            return 뷰(View) 결과물 session/request 저장(setAttribute)
         
      days07.mvc.board.domain 패키지      : DTO, VO, 자바빈 (데이터 정보 저장 객체)
      days07.mvc.board.persistence 패키지 : DAO 
      days07.mvc.board.service 패키지    : 서비스  
      
      요청 URL => 명령객체 (CommandHandler) WEB-INF/commandHandler.properties 파일
      
      MV[C] 컨트롤러 작성.
      
      
      http://localhost/mvc/board/view.htm?seq=157
  </xmp>
</div>
<script>

</script>
</body>
</html>























