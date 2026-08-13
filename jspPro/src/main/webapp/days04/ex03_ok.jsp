<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<%
String id =request.getParameter("id");
String passwd =request.getParameter("passwd");

String name; // 인정받은 사용자의 이름..을 저장할 변수 선언.
boolean auth; // authority 권한 true / false
//DB 연동: id+ passwd 체크
String location;
if(id.equals("admin") && passwd.equals("1234") ){ //admin 성공
	name = "관리자";
	auth = true; //관리자 권한 있다. 
	//URL에는 한글 사용 불가 -> %??
	location="ex03.jsp?name=" +  URLEncoder.encode(name) + "&auth="+ auth ;
	
}else if(id.equals("hong") && passwd.equals("1234") ) {//hong 로그인 성공
	name = "홍길동";
	auth = false;
	location="ex03.jsp?name=" +  URLEncoder.encode(name) + "&auth="+ auth ;
	
}else if(id.equals("kim") && passwd.equals("1234") ) {//kim 로그인 성공
	name = "김도훈";
	auth = false;
	location="ex03.jsp?name=" +  URLEncoder.encode(name) + "&auth="+ auth ;
}else{ //로그인 실패
	
	location="ex03.jsp?error";
}

//[1] 리다이렉트
//response.sendRedirect(location);


//[2] 포워딩 (&ㅁㅁㅁ=ㅇ 이거 보이게 하려고 사용.)
RequestDispatcher dispatcher=  request.getRequestDispatcher(location); //분배기
dispatcher.forward(request, response);



%>