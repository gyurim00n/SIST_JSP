<%@page import="java.util.function.Consumer" %>
<%@page import="java.sql.SQLException" %>
<%@page import="com.util.DBConn" %>
<%@page import="java.util.Iterator" %>
<%@page import="org.doit.domain.DeptVO" %>
<%@page import="org.doit.domain.EmpVO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.time.LocalDateTime" %>
<%@ page import="com.util.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String pdeptno = request.getParameter("deptno");
    if (pdeptno == null) {
        pdeptno = "10";
    }

%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<DeptVO> dlist = null;
    DeptVO dvo = null;
    Iterator<DeptVO> dir = null;

    conn = ConnectionProvider.getConnection();

    String dsql = """
              SELECT *
              FROM dept
              ORDER BY deptno ASC
            """;

    try {
        pstmt = conn.prepareStatement(dsql);
        rs = pstmt.executeQuery();

        int deptno;
        String dname, loc;

        if (rs.next()) {
            dlist = new ArrayList<DeptVO>();
            do {
                deptno = rs.getInt("deptno");
                dname = rs.getString("dname");
                loc = rs.getString("loc");

                dvo = DeptVO.builder()
                        .deptno(deptno)
                        .dname(dname)
                        .loc(loc)
                        .build();

                dlist.add(dvo);
            } while (rs.next());
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
    <title>2026-08-05 오후 4:06</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/SiSt.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/cdn-main/example.css">
    <script src="/resources/cdn-main/example.js"></script>
</head>
<body>
<header>
    <h1 class="main"><a href="#" style="position: absolute; top:30px;">kEnik HOme</a></h1>
    <ul>
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
    </ul>
</header>

<div>
    <xmp class="code">

    </xmp>
    <select name="deptno" id="deptno">
        <%
            dir = dlist.iterator();
            while (dir.hasNext()) {
                dvo = dir.next();
                int deptno = dvo.getDeptno();
                String dname = dvo.getDname();

        %>
        <option value="<%=deptno%>"><%=dname%>
        </option>
        <%
            }
        %>
    </select>
    <h3>emp list</h3>

    <table>
        <thead>
        <tr>
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
            <td colspan="8">
                <span id="empCount" class="badge left red">0명</span>
                <a href="javascript:history.back()">뒤로 가기</a>
            </td>
        </tr>
        </tfoot>
    </table>
</div>

<script>

    $(function () {

        $("#deptno").on("change", function () {
            getEmpInfo();
        });

        // 처음 페이지 로딩
        getEmpInfo();
    });

    // js
    /*let xhRequest;

    function getXMLHttpRequest() {

        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        }

        return null;
    }


    function getEmpInfo() {

        let deptno = $("#deptno").val();

        let url = "ex04_ajax.jsp?deptno=" + deptno;

        xhRequest = getXMLHttpRequest();

        xhRequest.onreadystatechange = callback;

        xhRequest.open("GET", url, true);

        xhRequest.send();
    }


    function callback() {

        if (xhRequest.readyState == 4 && xhRequest.status == 200) {

            let html = xhRequest.responseText;



            $("#empList").html(html);
        }
    }*/
    // jq
    function getEmpInfo() {
        let deptno = $("#deptno").val();

        let url = "ex04_ajax_rhh.jsp?deptno=" + deptno;

        $.ajax({
            url: url,
            type: "GET",
            cache: false,
            success: function (data) {
                $("#empList").html(data);
                let count = $(data).filter("tr").length;

                $("#empCount").html(count + "명");
            }
        })
    }
</script>
</body>
</html>