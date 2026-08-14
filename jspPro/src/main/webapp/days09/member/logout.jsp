<%@page import="days08.AuthUser"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<% 

	AuthUser authUser = (AuthUser)session.getAttribute("authUser");
	String logoutUser = authUser.getLoginUser();
	
	session.removeAttribute("loginUser");
	session.removeAttribute("loginUserRole");
	
	session.invalidate();


%>
<script>
	alert("<%=logoutUser%>님 로그아웃 되었습니다");
	location.href= "/days09/board/list.jsp";
</script>
<%

%>