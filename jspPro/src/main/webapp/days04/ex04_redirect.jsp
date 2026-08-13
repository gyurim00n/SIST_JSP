<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<% 
String name = request.getParameter("name");
String age = request.getParameter("age");


	String location = "ex04_finish.jsp?name="+ name + "&age=" + age;//리다이렉트라서 다시 변수를 챙겨줘야한다.
	response.sendRedirect(location);

%>