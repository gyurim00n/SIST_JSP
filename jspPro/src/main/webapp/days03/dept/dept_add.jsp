<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 2:26:24</title>
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
<div class="container">
  <xmp class="code">
   부서추가 dept_add.jsp
  </xmp>
  
  <h2>부서 추가</h2>
 	<form action="dept_add_ok.jsp" method="post" onsubmit="return checkForm();">
 		<table class="vertical">
 		 <caption><p class="validateTips">All form fields are required.</p></caption>
 		
 				<tr>
 					<th>부서번호</th>
 						<td><input type="text" id="deptno" name="deptno" autofocus="autofocus" /></td>
 					
 				</tr>
 				<tr>
 					<th>부서이름</th>
 						<td><input type="text" id="dname" name="dname"  class="long" /></td>
 					
 				</tr>
 				<tr>
 					<th>지역명</th>
 						<td><input type="text" id="loc" name="loc"  class="long" /></td>
 					
 				</tr>
 				<th></th>
 				<td>
 					<div class="btn_area group">
				 		<button type="submit" class="add">저장</button>
				 		<button type="reset" class="">다시 입력</button>
				 		<button type="button" class="list">목록</button>
 					</div>
 				</td>
 		</table>
 	
 
 	
 	</form>
</div>
<script>
$(".btn_area button.list").on("click", function(){
	location.href = "dept_list.jsp";
})
</script>
<script>

	 var  deptno = $("#deptno")
					,dname = $("#dname")
					,loc = $("#loc")
					, allFields = $( [] ).add( deptno ).add( dname ).add( loc ),
				      tips = $( ".validateTips" );
	
	 function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    };
	 function checkLength( o, n, min, max ) {
	      if ( o.val().length > max || o.val().length < min ) {
	        o.addClass( "ui-state-error" );
	        updateTips( "Length of " + n + " must be between " +
	          min + " and " + max + "." );
	        return false;
	      } else {
	        return true;
	      }
	    };
	 function checkForm() {
		 var valid = true;
	      allFields.removeClass( "ui-state-error" );
	 
	      valid = valid && checkLength( deptno, "deptno", 2, 2 );
	      valid = valid && checkLength( dname, "dname", 3, 14);
	      valid = valid && checkLength( loc, "loc", 3, 13);
	      
	      return valid;
	 };
	


</script>
</body>
</html>