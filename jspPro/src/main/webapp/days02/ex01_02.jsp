<%@page import="java.util.Objects"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

		// http://localhost/days02/ex01_02.jsp => request... 이거 null 나옴
		// http://localhost/days02/ex01_02.jsp?num => request... "" 나옴
		// http://localhost/days02/ex01_02.jsp?num=10 => request... 10 나옴
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
		<xmp class="code"> js or jq 사용 1~n까지의 합 처리 </xmp>

<%-- 		정수: <input type="text" id="num" autofocus="autofocus" value="<%= pNum==null ?  "" : pNum%>"/> <br /> --%>
<%-- 			정수: <input type="text" id="num" autofocus="autofocus" value="<%= Objects.toString(pNum, "")%>"/> <br />  --%>
			정수: <input type="text" id="num" autofocus="autofocus" value="${param.num} }"/> <br /> <!--Expression Language EL 사용.  -->
		<p id="demo"><%=content %></p>
	</div>
	<script>
		$("#num").on("keydown", function(e) {

			if (e.key === 'Enter') {
				alert("입력값에 대한 유효성 검사 완료!!!");
				let num = $(this).val();
				//쿠키 저장 num = 10, localStorage
				//jsp페이지 							
				location.href = `ex01_02.jsp?num=\${num}`;
			}

		}
		
		);
		
		$("#num").val('<%= Objects.toString(pNum, "")%>').select();
	</script>
	<!-- <script>
//쌤풀이1(클라이언트에서 계산)
  // one(), on(), off()
  $("#num").on({
     "keydown": function (e){
        if( !(
              /^[0-9]$/.test( e.key )  
              || ["Backspace", "Delete", "Enter", "Tab"
                 , "ArrowLeft","ArrowRight","Home",
                 "End"].includes( e.key )
              || e.isComposing       // 한글입력기(IME) 입력 중 ㄱ  229
            ) ){
           alert("숫자 입력하세요.");
           e.preventDefault();
        } // 
     },
     "keyup": function (e){
      if( e.key === 'Enter' ){
        // 1 ~ n 합 출력
        $("#demo").empty();
        let n = $(this).val();
        let sum = 0;
        for (var i = 1; i <= n; i++) {
         sum += i;
         $("#demo").html( function (index, oldHtml){
            return oldHtml + i + (i==n? "": "+");
         } ); // html
        } // for
        
        $("#demo").html( function (index, oldHtml){
            return oldHtml + "=" + sum;
         } ); // html
        
        $(this).select();
      } // if
     }
  });
</script> -->
</body>
</html>