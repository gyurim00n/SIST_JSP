<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오전 9:40:06</title>
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
   ex02_02.jsp
   
   코드 304그냥 캐시에 있는거 뿌리는거임 
   ㄴ실습에서는 304가 뜨면 안된다. 서버에 강제로 갔다와서 200이 뜨도록 설정해야한다.
  </xmp>
  
  <h3>서버요청시간: <%= new Date().toLocaleString() %></h3>
  <input type="button" value="jquery ajax test"/>
  <br />
  <p id="demo"></p>
</div>
<script>
$(":button").on("click", function(){
	//jq method: ajax 처리하는 load() 메서드
	$("#demo").load("ex02_ajax_info.txt", function(
			responseText
			, textStatus
			, jqXHR
			){
		if(textStatus == "success"){
			let replyText = responseText;
			let names = replyText.split(",");
			$("#demo").empty();
			for(let name of names){
				//$("#demo").append($("<li></li>")).text(name));
				$("#demo").append($(`<li>\${name}</li>`));
			}
		}
		
		
	});
});
</script>
</body>
</html>