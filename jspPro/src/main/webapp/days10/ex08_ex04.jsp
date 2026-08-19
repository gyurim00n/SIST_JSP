<%@page import="java.util.function.Consumer"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
    // ? 
    // ?deptno           
   String  pDeptno = request.getParameter("deptno");  
    int deptno = (pDeptno == null || pDeptno.trim().isEmpty()) ? 10   : Integer.parseInt(pDeptno);
%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null; 
   ResultSet  rs   = null; 
   ArrayList<DeptVO> dlist = null;
   DeptVO dvo = null;
   Iterator<DeptVO> dir = null;
      
   conn = DBConn.getConnection();
 
   String dsql = """
               SELECT *
               FROM dept
               ORDER BY deptno ASC
           """;
       
   try {
      pstmt = conn.prepareStatement(dsql);
      rs = pstmt.executeQuery();
      
      String dname, loc;
      
      if ( rs.next()  ) {   
         dlist = new ArrayList<DeptVO>();
         do {
            int dno = rs.getInt("deptno");
            dname = rs.getString("dname");
            loc = rs.getString("loc");
            
            dvo = DeptVO.builder()
                     .deptno(dno)
                     .dname(dname)
                     .loc(loc)
                     .build();
   
            dlist.add(dvo);
         } while (rs.next() );
      } // if
      
   } catch (SQLException e) {
      e.printStackTrace();
   } finally {
      try {
         rs.close();
         pstmt.close();
      } catch (SQLException e) { 
         e.printStackTrace();
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 5. 오후 4:06:20</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/cdn-main/example.css">
<script src="/resources/cdn-main/example.js"></script>
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
   ex08_04.jsp
  </xmp>
  
  <select id="deptno" name="deptno">
    <%
      dir = dlist.iterator();
      while( dir.hasNext() ){
         dvo = dir.next();
         int dno = dvo.getDeptno();
         String dname = dvo.getDname();
    %>
    <%-- <option value="<%= dno %>" <%= dno == deptno ? "selected": "" %>><%= dname %></option> --%>
    <option value="<%= dno %>"><%= dname %></option>
    <%     
      } // while
    %>
  </select>
  
  <h3>emp list</h3>
  
  <table>
    <thead>
      <tr>     
         <th><input type="checkbox" id="ckbAll" name="ckbAll"></th>
         <th>empno</th>
         <th>ename</th>
         <th>job</th>
         <th>mgr</th>
         <th>hiredate</th>
         <th>sal</th>
         <th>comm</th>
         <th>deptno</th>
     </tr> 
    </thead>
    <tbody id="empList">
   
    </tbody>
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red" id="empCount">0명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
          <br>
          <button>체크한 empno 전송</button>     
          <!-- ex04_ok.jsp li  empno 출력 -->     
        </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script>
$(function () {

    // 처음 페이지가 열렸을 때
    loadEmp($("#deptno").val());


    // 부서가 변경됐을 때
    $("#deptno").on("change", function () {

        let deptno = $(this).val();

        loadEmp(deptno);

    });

});


function loadEmp(deptno) {

    $.ajax({

        url: "ex08_ex04_emp.jsp",

        type: "GET",

        data: {
            deptno: deptno
        },

        dataType: "json",

        success: function (data) {
        	  
            let html = "";

            $.each(data.employees, function (index, emp) {

                html += `
                    <tr>
                        <td>
                            <input type="checkbox"
                                   id="ckb-${emp.empno}"
                                   data-empno="${emp.empno}">
                        </td>

                        <td>\${emp.empno}</td>
                        <td>\${emp.ename}</td>
                        <td>\${emp.job}</td>
                        <td>\${emp.mgr}</td>
                        <td>\${emp.hiredate}</td>
                        <td>\${emp.sal}</td>
                        <td>\${emp.comm}</td>
                        <td>\${emp.deptno}</td>
                    </tr>
                `;

            });
			console.log(html);
            // tbody에 tr 넣기
            $("#empList").html(html);

            // 인원수 표시
            $("#empCount").text(data.employees.length + "명");

        },

        error: function () {
            alert("사원 목록을 가져오는데 실패했습니다.");
        }

    });

}
</script>

</body>
</html>



