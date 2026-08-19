<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   Connection conn = DBConn.getConnection();
   PreparedStatement pstmt = null; 
   ResultSet  rs   = null; 
   ArrayList<DeptVO> dlist = new ArrayList<DeptVO>();
   
   String dsql = "SELECT * FROM dept ORDER BY deptno ASC";
       
   try {
      pstmt = conn.prepareStatement(dsql);
      rs = pstmt.executeQuery();
      
      if ( rs.next()  ) {   
         do {
            DeptVO dvo = DeptVO.builder()
                     .deptno(rs.getInt("deptno"))
                     .dname(rs.getString("dname"))
                     .loc(rs.getString("loc")).build();
            dlist.add(dvo);
         } while (rs.next() );
      }
   } catch (SQLException e) {
      e.printStackTrace();
   } finally {
      try { rs.close(); pstmt.close(); } catch (SQLException e) { }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2026. 8. 18. 오후 12:38:20</title>
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
  
  <select id="deptno" name="deptno">
    <% for(DeptVO dvo : dlist) { %>
    <option value="<%= dvo.getDeptno() %>"><%= dvo.getDname() %></option>
    <% } %>
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
    
    <tbody id="empbody">
    </tbody>
    
    <tfoot>
      <tr>
        <td colspan="9">
          <span class="badge left red">0명</span>
          <a href="javascript:history.back()">뒤로 가기</a>
        </td>
      </tr>
    </tfoot>
  </table>
</div>

<script>
    let xhRequest;
    
    function getXMLHttpRequest() {
        if (window.ActiveXObject) {
            try {
                return ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    return new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    return null;
                }
            }
        } else if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else {
            return null;
        }
    }
    
    $(document).ready(function() {
        let initDeptno = $("#deptno").val();
        getEmpList(initDeptno);
    });

    $("#deptno").on("change", function (){
        let deptno = $(this).val(); 
        getEmpList(deptno);
    });

    function getEmpList(deptno) {
        let url = `ex08_ajax_ajb.jsp?deptno=\${deptno}`;
        
        xhRequest = getXMLHttpRequest();
        xhRequest.onreadystatechange = callback;
        xhRequest.open("GET", url, true);
        xhRequest.send();
    }

    function callback() {
        if ( xhRequest.readyState == 4 ) { 
            if ( xhRequest.status == 200 ) {
                let data = xhRequest.responseText;
                
                $("#empbody").html(data);
                
                let count = $("#empbody :checkbox").length;
                $("tfoot .badge").text(count + "명");
            } else {
                alert("데이터 통신 에러! 상태 코드: " + xhRequest.status);
            }
        }
    }
</script>
</body>
</html>