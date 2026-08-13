<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오전 9:40:22</title>
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
   [JSP 구성 요소 중 "JSP 스크립트 요소 3가지"]p67
   1. 스크립트릿 %			:자바 코딩 블럭
   2.표현식 %=			:어떤 값을 출력
   3. 선언문 %!			:스크립트릿, 표현식에서 사용할 메서드를 선언
   
   
				   브라우저
				    │
				    │ ① HTTP 요청
				    ▼
				Tomcat
				    │
				    │ ② JSP 파일 찾기
				    ▼
				Jasper(JSP 엔진)
				    │
				    │ ③ JSP → Servlet(.java)
				    ▼
				Java Compiler(JDT)
				    │
				    │ ④ .java → .class
				    ▼
				Servlet 객체 생성
				    │
				    │ ⑤ service()
				    ▼
				_jspService()
				    │
				    │ ⑥ HTML 생성
				    ▼
				Tomcat
				    │
				    │ ⑦ HTTP 응답
				    ▼
				브라우저
  </xmp>
  
<%
	//1. 스크립트릿
	//ㄱ. name  변수 선언
	//ㄴ. for 문
	//
	String name= "홍길동";
	age = 30;
	for(int i=1; i<=10; i++){
		//%= 표현식으로 i 출력하고 스크립트릿을 분리
		%>
		i = <%= i %><br>
		<% 
	}
%>

<hr />
	이름:<%= name %><br>
	나이:<%= age %><br>
	getMessage(): <%=getMessage("관리자") %>
	
	<!-- 선언부: 변수, 메서드 선언... -->
	<%! //얘는 전역변수가 된다...맨위에 언급된...
		int age = 20; 
		public String getMessage(String msg){
			return "안녕~" + msg;
		}
	
	%>
	
	<!-- // C://class..JSPClass.jspPro
	
	웹서버에 배포된 경로...(가상의 배포된..)
	C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\jspPro\days03
	
	ex02jsp.java 경로:
	C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost\ROOT\org\apache\jsp\days03
	  -->
</div>
<script>
</script>
</body>
</html>

