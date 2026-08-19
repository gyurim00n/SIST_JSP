<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오후 12:02:00</title>
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
   ex06_cd_catalog.xml
  </xmp>
   <h3>서버요청시간: <%= new Date().toLocaleString() %></h3>
  <input type="button" value="jq xml loading"/>
  <br />
  <p id="demo"></p>
  
</div>
<script>
$(":button").on("click", function(){
	let url =  'ex06_cd_catalog.xml';
	//jq method: $.ajax() ajax method
	$.ajax({
		url: url,
		type: "GET",
		// data: params
		cache: false, //동일한 요청이어도 무조건 갓다오란 뜻
		dataType: "xml",
		success:function(data){	//json ->js Object 자동변환
			const cdList = data.getElementsByTagName("CD");
			//alert(cdList.length); //26
			let content =  `<table>
					       <tr>
					            <th>TITLE</th>
					            <th>ARTIST</th>
					      </tr>`;
					      for(var i=0; i <cdList.length; i++){
				             let title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
				             let artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
				             content += `
				                  <tr>
				                    <td>\${ title }</td>
				                    <td>\${ artist }</td> 
				                  </tr>
				                `;
				       }  ; // }) 제거;         
			
					      
			content += `</table>`;
			$("#demo").html(content);
		}, err: function(xhr,status,error){
			alert("에러 발생:" + error);
		}
		
		
	});
	 
	 
 });
</script>
</body>
</html>