<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 19. 오전 8:56:39</title>
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
   days11.ex01.jsp
 	Ajax 예제, 파일업로드 + ajax 
  </xmp>
    <h2>회원 가입 페이지</h2>
  
  <form>
    deptno	  : <input type="text" name="deptno" value="10" /><br>
    empno(id) : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" value="ID 중복체크 - jquery ajax">
    <p id="notice"></p>
    <br>
    ename 	  : <input type="text" name="ename" /><br>
    job 	  : <input type="text" name="job" value="" /><br>   
    
    <br>
    <input type="submit" value="회원(emp) 가입">
  </form>
  <h3></h3>
</div>
<script>

$(function (){		//모든 것이 로딩되어 준비가 되면...
	
	$("#btnEmpnoCheck").on("click", function(){
		
		let params = $("form").serialize();
		const empno = $("input[name=empno]").val();
		$.ajax({
			//url : "exo1_idcheck.jsp?empno="+empno
			url: "ex01_idcheck.jsp" 
			, type: "GET"
			, data: { empno : empno}
			//,data:params 많은 파ㅣ라미터를 가지고 요청...
			, cache:false
			, dataType:"json"
			,success: function(data, textStatus, jqXHR){
				//alert(data); {"count":1}
				if(data.count == 1){
					$("#notice").css("color", "red").text("이미 사용중인 ID입니다");
				}else{
					$("#notice").css("color", "green").text("사용가능한 ID입니다!");
					idcheck = true;
				}
			}, error:function(){
				alert("Ajax 에러 발생~");
			}
			
		});//ajax
		
		
	});//"#btnEmpnoCheck").on("click"
})//function()
</script>
</body>
</html>