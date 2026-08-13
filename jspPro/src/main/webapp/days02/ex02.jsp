<%@page import="java.util.function.Consumer"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null; // SQL 실행하는 객체
ResultSet rs = null; // 실행 결과를 저장하는 객체
ArrayList<DeptVO> list = null;
DeptVO vo = null;
Iterator<DeptVO> ir = null;

// 1 + 2
conn = DBConn.getConnection();

// 3. sql작성->stmt sql실행-> rs -> ArrayList 저장 -> 출력
//String sql = "SELECT * "
//        + " FROM dept "
//        + " ORDER BY deptno ASC";
// Java 15 이상: 텍스트블럭 
String sql =   """
Select *
FROM dept 
ORDER BY deptno ASC
""";

try {
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	int deptno;
	String dname, loc;

	if (rs.next()) { // 첫 번째 레코드는 존재한다.
		list = new ArrayList<DeptVO>();
		do {
	deptno = rs.getInt("deptno");
	dname = rs.getString("dname");
	loc = rs.getString("loc");
	//         vo = new DeptVO(deptno, dname, loc);
	vo = DeptVO.builder().deptno(deptno).dname(dname).loc(loc).build();

	//         System.out.println( vo );
	list.add(vo);
		} while (rs.next());
	} // if

	

} catch (SQLException e) {
	e.printStackTrace();
} finally {
	try {
		rs.close();
		pstmt.close();
		// 4
		DBConn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오전 11:02:59</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.2/jquery-ui.js"></script>
  <script>
$( function() {
    $( "input:checkbox[name=deptno]" ).checkboxradio();
  } ); 
  </script>
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
   ex02.jsp
  </xmp>
   <h2>Checkbox</h2>
  
	  <fieldset >
	    <legend>dept info: </legend>
	    <!-- <label for="checkbox-1">2 Star</label>
	    <input type="checkbox" name="checkbox-1" id="checkbox-1">
	    <label for="checkbox-2">3 Star</label>
	    <input type="checkbox" name="checkbox-2" id="checkbox-2">
	    <label for="checkbox-3">4 Star</label>
	    <input type="checkbox" name="checkbox-3" id="checkbox-3">
	    <label for="checkbox-4">5 Star</label>
	    <input type="checkbox" name="checkbox-4" id="checkbox-4"> -->
	    
	    <% ir= list.iterator();
	    while(ir.hasNext()){
	    	vo = ir.next();
	    	int deptno = vo.getDeptno();
	    	String dname = vo.getDname();
	    	%>
	    	<label for="deptno-<%=deptno %>"><%=dname %></label>
	    	<input type="checkbox" name="deptno" id="deptno-<%=deptno %>" value=<%=deptno %> >
	    	<%
	    }
	    %>
	  </fieldset>

	<input type="submit" value="사원확인" />
</div>
<script>
/* $("form").on("submit", function(){
	let cboxLen = $(":checkbox[name=deptno]:checked").length;
	if(cboxLen == 0){
		alert("부서를 선택하세요!");
		event.preventDefault();
		
	}//if
	
}) */
</script>
<script>
$(":input[value='사원확인']").on("click", function(){

    let cbox = $(":checkbox[name=deptno]:checked");

    if(cbox.length == 0){
        alert("부서를 선택하세요!");
        return;
    }

    const deptnos = [];

    cbox.each(function(index, element){
        let deptno = $(element).val();
        deptnos.push(`deptno=\${deptno}`);
    });

    location.href = `ex02_02.jsp?\${deptnos.join('&')}`;
});
</script>
</body>
</html>