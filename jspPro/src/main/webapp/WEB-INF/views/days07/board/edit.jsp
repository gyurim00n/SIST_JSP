<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 13. 오전 10:25:13</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
</head>

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
		<xmp class="code"> day07 </xmp>
		<h3>게시판 수정</h3>
		<form action="" method="post">
			<table>
				<tr>
					<td colspan="2" align="center"><b>글을 수정합니다.</b></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="writer" size="15"
						value="${ dto.writer }" disabled="disabled"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pwd" size="15"
						required="required"></td>
				</tr>
				<tr>
					<td align="center">Email</td>
					<td><input type="email" name="email" size="50"
						value="${dto.email}"></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="title" size="50"
						required="required" value="${ dto.title }"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="content" cols="50" rows="10">${dto.content }</textarea></td>
				</tr>
				<tr>
					<td align="center">HTML</td>
					<td><input type="radio" name="tag" value="1">적용 <input
						type="radio" name="tag" value="0">비적용 <script>
            	//$(":radio[name=tag][value=${dto.tag}]").attr("checked", "checked");
            	$(":radio[name=tag][value=${dto.tag}]").prop("checked", true);
            	
            	</script></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="작성 완료"> &nbsp;&nbsp;&nbsp; <a
						href="javascript:history.back()">뒤로 가기</a></td>
				</tr>
			</table>

		</form>

	</div>
	<script>
</script>
</body>
</html>