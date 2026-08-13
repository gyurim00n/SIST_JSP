<%@ include file="/WEB-INF/inc/cookieInc.jspf"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 12. 오전 11:46:52</title>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">kEnik HOme</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> view.jsp (days07) </xmp>
		<h3>게시글 상세보기</h3>
		<table>
			<thead>

			</thead>
			<tbody>
				<tr>
					<th>이름</th>
					<td>${dto.writer}</td>
					<th>등록일</th>
					<td>${dto.writedate}</td>

				</tr>
				<tr>
					<th>Email</th>
					<td>${dto.email}</td>
					<th>조회수</th>
					<td>${dto.readed}</td>

				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${dto.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" class="full"
						style="height: 200px; vertical-align: top;">${dto.content}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
						<a href="${pageContext.request.contextPath}/mvc/board/edit.htm?seq=${dto.seq}">수정</a>
						<a href="${pageContext.request.contextPath}/mvc/board/delete.htm?seq=${dto.seq}&writer=${dto.writer}">삭제</a>
						<a href="${pageContext.request.contextPath}/mvc/board/list.htm">목록</a>
						<input type="button" id="btnModalDelete" value="모달창 삭제"/>
						</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- 삭제 모달창 -->
	<div id="dialog-form" title="삭제 모달창">
		<h3>게시판삭제</h3>
		<form action="${pageContext.request.contextPath}/mvc/board/delete.htm?seq=${param.seq}" method="post">
			<table>
				<tr>
					<td colspan="2" align="center"><b>삭제하려면 비밀번호를 입력하세요.</b></td>
				</tr>

				<tr>
					
					<td align="center">비밀번호</td>
					<td><input type="password" name="pwd" size="15"
						required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="작성 완료"> &nbsp;&nbsp;&nbsp; 
					<%-- 	<a href="${pageContext.request.contextPath}/mvc/board/view.htm?seq=${param.seq}">뒤로가기</a> --%>
						<input type="button"  value="취소" id="cancel"/>
						</td>
				</tr>
			</table>
			<span style="color:red; display:none" id ="spn"> 비밀번호가 잘못되었습니다.</span>
		</form>
	</div>
	<script>
	var dialog, form;
	 dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 400,
    width: 350,
    modal: true,
    buttons: {
    },
    close: function() {
      form[ 0 ].reset();
    }
  }); 
  
  form=dialog.find("form");
  
  $("#btnModalDelete").on("click", function(){
	  dialog.dialog("open");
  })
  
  $("#cancel").on("click", function(){
	  dialog.dialog("close");
  })
  
  //모달창 띄워서 삭제가 실패한 경우
  
	</script>
	 
	
	<script>
		// 목록 버튼
		$("tfoot a")
				.last()
				.attr(
						"href",
						function(index, oldHref) {

							let searchKeyword = encodeURIComponent("${param.searchKeyword}");
							let npp = 10;
							return `\${oldHref}?currentPage=${param.currentPage}&numberPerPage=\${npp}&searchCondition=${param.searchCondition}&searchKeyword=\${searchKeyword}`;
						});
	</script>
	<script>
		
	</script>
</body>
</html>