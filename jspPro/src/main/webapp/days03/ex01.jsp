<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 8:58:52</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://code.jquery.com/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <script src="https://code.jquery.com/ui/1.14.2/jquery-ui.js"></script>
 <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
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
   1.jsp 페이지에서 - get /post 방식 요청...
   2.Servlet  - get/post 방식 요청...
   
  </xmp>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">JSP - get 방식 요청</a></li>
    <li><a href="#tabs-2">JSP - post 방식 요청</a></li>
    <li><a href="#tabs-3">JSP - sublet 방식 요청</a></li>
  
  </ul>
			<div id="tabs-1">
				<p>
				<ol>
				<li>웹 브라우저 + 주소창 url 입력 후 요청  - get 방식 요청</li>
				<li> a 링크 요청  - get 방식 요청</li>
				<li> location.href 요청  - get 방식 요청</li>
				<li> form method = 'get' 요청 - get 방식 요청</li>
				
				</ol>
				
				<br />
				정수 : <input type="text" id="n" name= "n" value="10"/>
				<a href="ex01_ok.jsp">ex01_ok.jsp</a>

				</p>
			</div>
			<div id="tabs-2">
				<p>
					<form>
						Name : <input type="text" id="name" name="name" value="홍길동"><br>
	         			age : <input type="text" id="age" name="age" value="20"><br> 
         
			        <input type="radio" name="method" value="get" checked="checked">GET 요청
			       	<input type="radio" name="method" value="post">POST 요청
       
       				<br> 
			       	<button type="button">전송(submit)</button>
			       </form>
			   </p>
				
			</div>
			<div id="tabs-3">
				<p>
					<form>
						Name : <input type="text" id="name" name="name2" value="홍길동"><br>
	         			age : <input type="text" id="age" name="age2" value="20"><br> 
         
			        <input type="radio" name="method2" value="get" checked="checked">GET 요청
			       	<input type="radio" name="method2" value="post">POST 요청
       
       				<br> 
			       	<button type="button">전송(submit)</button>
			       </form>
			   </p>
				
			</div>

		</div>

</div>
<script>
//서블릿의 get/post 체크 ! 

$("#tabs-3 button").on("click", function(){
	let method = $("#tabs-3 :radio[name='method2']:checked").val();
	$(this).parent()
			.attr({
				"method": method,
				"action": "/days03/ex01_ok_03.ss", // 서블릿의 요청을 url로 쓰겟다.
				
			})
			.submit(); // 폼 태그를 submit 하겠다... 
	
});//click
</script>
<script>
$("#tabs-2 button").on("click", function(){
	let method = $("#tabs-2 :radio[name='method']:checked").val();
	$(this).parent()
			.attr({
				"method": method,
				"action": "ex01_ok_02.jsp",
				
			})
			.submit(); // 폼 태그를 submit 하겠다... 
	
});//click
</script>

<script>
//풀이[2]
$("#tabs-1 a").on("click", function(){
	$(this).attr("href", function(index, oldHref){ //oldHref는 원래 제공됨.
		let n = $("#n").val();
		return  `\${oldHref}?n=\${n}`;
		
	});
	
});



//풀이 [1]
/* $("#tabs-1 a").on("click", function(){
	//href="ex01_ok.jsp?n=10"
	let n = $("#n").val();
	let oldHref = $(this).attr("href");//"ex01_ok.jsp
	let newHref = `\${oldHref}?n=\${n}`;//"ex01_ok.jsp?n=10
	$(this).attr("href", newHref);
	
	
}) */
</script>
</body>
</html>