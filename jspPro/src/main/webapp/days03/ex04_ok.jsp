<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 12:21:24</title>
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
   ex04_ok.jsp
   
  </xmp>
  <% 
  	Enumeration<String> en  = request.getParameterNames();
  while(en.hasMoreElements()
		  ){
	  String paramName= en.nextElement();
	  %>
	  		<%= paramName %>
	  <%
  }//while
  %>
  <hr />
 <!--  EL + JSTL -->
 
 <% //en => list 변환 
 List<String> pNames = Collections.list(request.getParameterNames());
 
 %>
 
 <c:forEach items="<%=pNames %>" var="pn">
 	>>전송된 파라미터 이름: ${pn} <br>
 </c:forEach>
  
  >이름: <%	
  
  String name =request.getParameter("name"); 
  String gender =request.getParameter("gender"); 
  String[] pets = request.getParameterValues("pet");
  
  %><br>
  >이름 EL:  "${param.name}"<br>
  >성별: <%= gender.equals("m") ? "남자": "여자"%> <br>
  >좋아하는 동물 : <% Arrays.toString(pets);%> <br>
  
  
  <!-- EL -->
  <c:forEach items= "${paramValues.pet}" var="pet">
  	<li>${pet}</li>
  </c:forEach>
  
  <hr>
  
  <b>request.getParameterMap() 메서드사용 </b><br>
  <% 
  	Map parameterMap = request.getParameterMap();
  	String[] nameParam = (String[])parameterMap.get("name");
  	if(nameParam!= null){
  		%>
  		name= <%=nameParam[0] %>
  		<%
  		
  	}
  
  %>
  
  <!-- 주의 entry.value 는  String [] 이다 -->   
  <c:forEach items="<%= request.getParameterMap()%>" var="entry">
     ${ entry.key } : ${ Arrays.toString(entry.value) }<br>  
  </c:forEach>
  
  <hr>
</div>
<script>
</script>
</body>
</html>