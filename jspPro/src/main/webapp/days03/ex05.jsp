<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 6. 오후 2:03:35</title>
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
    <li><a href="${pageContext.request.contextPath}/days03/dept/dept_list.jsp">부서관리</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
   부서목록 dept_list.jsp + [부서 추가 버튼]
   부서목록 dept_add.jsp + [저장 버튼]
   		입력값에 대한 유효성 검사
   	DB 부서추가 dept_add_ok.jsp 구현 + DB insert+ 경고창(알림) + 부서목록 이동...
   	부서목록에서 하나의 부서명을 클릭하면 부서 상세보기 dept_view.jsp 로 이동...
   	삭제 버튼을 클릭하면 dept_delete.jsp?deptno=50 페이지로 요청 -> 부서목록 이동
   	부서 상세보기에서 [목록][수정***][삭제]
  </xmp>
</div>
<script>
</script>
</body>
</html>