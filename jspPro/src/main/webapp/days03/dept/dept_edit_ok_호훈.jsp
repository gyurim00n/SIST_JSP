<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.DBConn" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.SQLIntegrityConstraintViolationException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    int deptno = Integer.parseInt(request.getParameter("deptno"));
    String dname = request.getParameter("dname");
    String loc = request.getParameter("loc");

    Connection conn = null;
    PreparedStatement pstmt = null;

    conn = DBConn.getConnection();

    String sql = """
            UPDATE dept
            SET dname = ?, loc = ?
            WHERE deptno = ?
            """;

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, dname);
        pstmt.setString(2, loc);
        pstmt.setInt(3, deptno);

        int rowCount = pstmt.executeUpdate();

        if (rowCount == 1) {
            response.sendRedirect("dept_list.jsp");
            return;
        } else {
%>
<script>
    alert("부서 수정 실패");
    history.back();
</script>
<%
        }

    } catch (SQLIntegrityConstraintViolationException e) {
%>
<script>
    alert("이미 존재하는 부서번호입니다.");
    history.back();
</script>
<%
    } catch (SQLException e) {
        e.printStackTrace();
%>
<script>
    // alert("DB 오류가 발생했습니다.");
    // history.back();
</script>
<%
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            DBConn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>