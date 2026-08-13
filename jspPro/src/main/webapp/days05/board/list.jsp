<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 10. 오전 9:12:48</title>
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
   /days05/board/list.jsp
  </xmp>
  <h3>Board 목록</h3>
  <table>
  	<caption style="text-align:right;" >
  		<a href="${pageContext.request.contextPath}/cstvsboard/write.htm">글쓰기</a>
  	</caption>
  	<thead>
	  	<tr>
	  		<th width="10%">번호</th>
	  		<th width="45%">제목</th>
	  		<th width="17%">작성자</th>
	  		<th width="20%">등록일</th>
	  		<th width="10%">조회</th>
	  	</tr>
  	</thead>
  	<tbody>
  		<c:choose>
  		<c:when test="${empty list}">
  			<tr>
  				<td colspan="5">
  					등록된 게시글이 없습니다.
  				</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			<c:forEach items="${list}" var="dto">
  				<tr>
	  				<td>${dto.seq} </td>
	  				<td>
	  				<a href="${pageContext.request.contextPath}/cstvsboard/view.htm?seq=${dto.seq}">${dto.title} </a>
	  				</td>
	  				<td>${dto.writer} </td>
	  				<td>${dto.writedate} </td>
	  				<td>${dto.readed} </td>
  				</tr>
  			</c:forEach>
  		</c:otherwise>
  		</c:choose>
  	</tbody>
  	<tfoot>
  		<tr>
  			<td colspan = "5" align="center">
  				<!-- [1] 2  3 ... 10 next-->
  				<div class="pagination">
  					<c:if test="${pDto.prev}">
  					<a href="${pDto.startPage-1}">&lt;</a></c:if>
  					<c:forEach begin="${pDto.startPage}" end="${pDto.endPage}" step="1" var="i">
  						  	<%-- <c:if test="${i == pDto.currentPage}">
					        <a href="?currentPage=${i}" class="active">${i}</a>
						    </c:if>
						
						    <c:if test="${i != pDto.currentPage}">
						        <a href="?currentPage=${i}">${i}</a>
						    </c:if> --%>
						<a href="${i}" class="${i == (empty param.currentPage? 1: param.currentPage) ? 'active': ''}">${i}</a> <!--  -->
  					</c:forEach>
  					<c:if test="${pDto.next}">
  						<a href="${pDto.endPage+1}">&gt;</a>
  						
  					</c:if>
  				</div>
  			</td>
  		</tr>
  		<tr colspan="5" align="center">
  			<form>
	  			<select name="searchCondition" id="searchCondition">
	  			<%-- 	<option value="t" ${param.searchCondition == 't' ? 'selected' : '' }>title</option> <!--jsp의EL 표현. 서버에서 처리한다.  -->
	  				<option value="c" ${param.searchCondition == 't' ? 'selected' : '' }>content</option>
	  				<option value="w" ${param.searchCondition == 't' ? 'selected' : '' }>writer</option>
	  				<option value="tc" ${param.searchCondition == 't' ? 'selected' : '' }>title+content</option> --%>
	  				<option value="t">title</option>
	  				<option value="c">content</option>
	  				<option value="w">writer</option>
	  				<option value="tc">title+content</option>
	  			</select>
	  			<script>
	  			let scd = ("${param.searchCondition}") == "" ? "t" : ("${param.searchCondition}")
	  					$("#searchCondition").val(scd); //보여도 되는 데이터면 script에 작성한다. 
	  			</script>
	  			<input type="text" name="searchKeyword" id="searchKeyword" value="${param.searchKeyword}"/>
	  			<input type="submit" value="search"/>
  			</form>
  		</tr>
  	</tfoot>
  </table>
  	<c:if test="${not empty param.success }">
	<script>
		alert("게시글 등록 완료!");
	</script>
	</c:if>
	
</div>
<script>
//검색어에 한글, 공백, 특수문자 등 들어가면 url 인코딩 문제 처리 필요....

$(".pagination a:not(.active)").attr("href", function(index, oldHref){
	/* return `${pageContext.request.contextPath}/cstvsboard/list.htm?`
			+`currentPage=\${oldHref}`
			+`&numberPerPage=${param.numberPerPage}`
			+`&searchCondition=${param.searchCondition}`
			+`&searchKeyword=${param.searchKeyword}`;
			
 */
	let searchKeyword = encodeURIComponent("${param.searchKeyword}");

	return `${pageContext.request.contextPath}/cstvsboard/list.htm`
	 + `?currentPage=\${oldHref}`
	 + `&numberPerPage=${param.numberPerPage}`
	 + `&searchCondition=${param.searchCondition}`
	 + `&searchKeyword=\${searchKeyword}`;
});

//return `${pageContext.request.contextPath}/cstvsboard/list.htm?currentPage=\${oldHref}&numberPerPage=${param.numberPerPage}`;

// 다만 검색어에 한글, 공백, 특수문자 등이 들어가면 URL 인코딩 문제 처리 필요

 
 <%--  [두 번째 방법]
 특히 <c:url> + <c:param> 조합을 추천합니다.
 한글 검색어뿐 아니라 공백, &, ? 같은 특수문자도 URL에 맞게 처리해 주기 때문입니다.
 contextPath 생략 가능

<c:url var="viewUrl" value="/cstvsboard/view.htm">
  <c:param name="seq" value="${dto.seq}" />
  <c:param name="currentPage" value="${param.currentPage}" />
  <c:param name="numberPerPage" value="${param.numberPerPage}" />
  <c:param name="searchCondition" value="${param.searchCondition}" />
  <c:param name="searchKeyword" value="${param.searchKeyword}" />
</c:url>

<a href="${viewUrl}">${dto.title}</a>
--%>
</script>
</body>
</html>