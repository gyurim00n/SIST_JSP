<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 19. 오전 10:43:51</title>
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
cors.jar 사용시 multifile 못씀- >다중파일 선택 불가
input 태그를 동적으로 더 만드는 수밖에 없다.
   ex04_ok.jsp
  </xmp>
  
  <%
  String saveDir = pageContext.getServletContext().getRealPath("/days11/upload");
  System.out.printf("❤️❤️" + saveDir);
  
  File f = new File(saveDir);
  if(!f.exists()){
	f.mkdirs();  
  };
  
  int maxSize = 5*1024*1024;// 5MB 기본단위 byte
  
  //upload <= a.txt						a.txt  존재? ->인덱스 사용
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
  
  /* 	MultipartRequest mrequest = new MultipartRequest(
  			request
  			,saveDir
  			,maxSize
  			,"UTF-8"
  			,policy
  			);   */
  
  %>
</div>
<script>
</script>
</body>
</html>