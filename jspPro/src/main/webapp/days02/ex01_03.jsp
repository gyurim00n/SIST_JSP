<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

		String content = "";
		String pNum =(request.getParameter("num"));
		int num;
		int sum = 0;
		//pNum.equals("") == pNum.trim().isEmpty()
		if(!(pNum == null || pNum.equals(""))){
			num = Integer.parseInt(pNum);
			for(int i=1 ; i<=num ; i++){
			sum += i;
			content += i==num ? i + "" : i + "+"; 
			}
			content += "=" + sum;
		
			
		}else{}
		
	
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오전 9:01:51</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">kEnik HOme</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> js or jq 사용 1~n까지의 합 처리 
		input에 name이 들어가지않으면 파라미터 param을 받아올수없다.
		</xmp>

			<form action="">
			정수: <input type="text" id="num" name= "num" autofocus="autofocus" value="${param.num}"/> <br /> 
			</form>
		<p id="demo"><%=content %></p>
	</div>
	<script>
		$("form").on("submit", function(e){
			alert("서브밋 될떄 submit 이베ㄴ트에 의해 호출됨. ")
			//e.preventDefult(); //이벤트 취소 
			
			
		})
		
		$("#num").select();
	</script>

</body>
</html>