<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 14. 오후 3:06:31</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kEnik HOme</a></h1>
  <ul>
   <c:choose>
    	<c:when test="${ empty sessionScope.authUser.loginUser}"><!--  인증 x -->
    		<a href="/days09/member/logon.jsp">로그인</a>
    	</c:when>
    	<c:otherwise><!--  인증 o -->
    	[${authUser.loginUser} ]<a href="/days09/member/logout.jsp">로그아웃</a>
    	</c:otherwise>
    </c:choose>
  </ul>
</header>
<div>
  <xmp class="code">
   ex05.jsp
   days09폴더 (webapp)
   ㄴex05 jsp
   ㄴadmin폴더:인증 o + 관리자 권한 o (admin)
   		ㄴmemberManage.jsp 회원관리 페이지
   		ㄴpayManage.jsp급여관리 페이지...
   		/admin/* 주소 안이 이렇게 되면 인증+ 관리자 필터링! 
   		
   ㄴboard폴더
   		ㄴlist.jsp		인증 x 
   		ㄴview.jsp		인증 x
   		ㄴwrite.jsp		인증 o 
   		ㄴedit.jsp		인증 o 
   		ㄴdelete.jsp		인증 o 
   		/board/
   	ㄴmember 폴더			인증 x (인증 o된 상태.)
   		ㄴaddMember.jsp 회원가입 페이지
   		ㄴlogon.jsp		로그인 페이지
   		ㄴlogout.jsp		로그아웃 페이지
   		
   
   [ 필터 작성 ]
   1. AuthenticationFilter 인증필터  
      요청URL:  /days09/admin/* 
      요청URL:   /days09/board/write.jsp
                /days09/board/edit.jsp
                /days09/board/delete.jsp               
      
   2. AuthorizationFilter  권한필터 - ADMIN, MANAGER, USER
      요청URL:  /admin/*   ADMIN 권한 O     
  	
  	                
  	                
  	                
  	                
  	                    HTTP 요청
                       │
                       ▼
             AuthenticationFilter
                  로그인 확인
                       │
             ┌─────────┴─────────┐
             │                   │
        /board/write        /member/*
             │                   │
             │          AdminAuthorizationFilter
             │                   │
             │              ADMIN 확인
             │                   │
             ▼                   ▼
        Controller          Controller
  </xmp>

  	
  	<a href="/days09/member/logon.jsp">로그인</a> <br>
  	<a href="/days09/member/logout.jsp">로그아웃</a>  <br>
  	<a href="/days09/board/list.jsp">게시판 목록</a> <br>
  	<a href="/days09/admin/payManage.jsp">관리자 급여관리</a> <br>
  
</div>
<script>
</script>
</body>
</html>