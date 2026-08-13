<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%
	String name = "홍길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 11. 오후 12:31:45</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<body>
<%-- <jsp:include page="/layout/top.jsp" flush="false"></jsp:include> --%>
<%@ include file= "/layout/top.jsp" %>
<div>
  <xmp class="code">
   ex05_template.jsp - 일정관리 파트...
   	 TOP
   L [] R
   BOTTOM
   
   -include 지시자는 모든 페이지에서 공통으로 사용하는 코딩(변수 선언)
   -layout(배치)할 때도 활용한다. 
  </xmp>
  
  <table>
  <tr height="500px">
  	<td	width="120px" valign="top">
  	
  		<%-- <jsp:include page="/days06/layout/left.jsp" flush="false"></jsp:include> --%>
  		<%@ include file= "/days06/layout/left.jsp" %>
  	</td>
  	<td>
  		일정 관리 내용 부분 <br />
  		일정 관리 내용 부분 <br />
  		일정 관리 내용 부분 <br />
  		일정 관리 내용 부분 <br />
  		일정 관리 내용 부분 <br />
  		일정 관리 내용 부분 <br />
  	</td>
  	<td	width="120px" valign="top">
  		<%-- <jsp:include page="/days06/layout/right.jsp" flush="false"></jsp:include> --%>
  		<%@ include file= "/days06/layout/right.jsp" %>
  	</td>

  </tr>
  
  </table>
</div>
<%@ include file= "/layout/bottom.jsp" %>
<%--  <jsp:include page="/layout/bottom.jsp" flush="false"> 

	<jsp:param value="name" name="teamLeader"/>
</jsp:include> --%>
<script>
</script>
</body>
</html>