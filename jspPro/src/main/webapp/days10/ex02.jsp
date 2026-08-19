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
   	ex02.jsp
  </xmp>
  <h3>서버요청시간: <%= new Date().toLocaleString() %></h3>
  <input type="button" value="js ajax test" onclick="load('ex02_ajax_info.txt')"/>
  <br />
  <p id="demo"></p>
</div>
<script>
function load(url){
	xhRequest = getXMLHttpRequest();
	xhRequest.onreadystatechange= callback;
	xhRequest.open("GET", url, true);
	xhRequest.send();
	
}


function callback(){
	
	if( xhRequest.status == 200 && xhRequest.readyState == 4 ) {
		//alert("XX");
		//console.log(xhRequest.responseText);
		let replyText = xhRequest.responseText;
		let names = replyText.split(",");
		$("#demo").empty();
		for(let name of names){
			//$("#demo").append($("<li></li>")).text(name));
			$("#demo").append($(`<li>\${name}</li>`));
		}
		
		
	}
	
}

let xhRequest;		//XMLHttpREquest 비동기처리 객체 변수 선언

function getXMLHttpRequest(){
    if (window.ActiveXObject) { // IE
     try{
      return  ActiveXObject("Msxml2.XMLHTTP");
     }catch(e){
        try{
           return new ActiveXObject("Microsoft.XMLHTTP");
        }catch(e){
           return null;
        }
     }
    }else if( window.XMLHttpRequest  ){
       return new XMLHttpRequest();
    }else {
       return null;
    }
 }
</script>
</body>
</html>