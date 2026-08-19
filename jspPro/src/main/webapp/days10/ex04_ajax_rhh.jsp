<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.util.DBConn" %>
<%@ page import="org.doit.domain.EmpVO" %>
<%@ page import="com.util.ConnectionProvider" %>

<%
    String pdeptno = request.getParameter("deptno");

    if (pdeptno == null) {
        pdeptno = "10";
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    ArrayList<EmpVO> elist = new ArrayList<>();

    String esql = """
        SELECT empno, ename, job, mgr,
               hiredate, sal, comm, deptno
        FROM emp
        WHERE deptno = ?
        ORDER BY empno
    """;

    try {

        conn = ConnectionProvider.getConnection();

        pstmt = conn.prepareStatement(esql);

        pstmt.setInt(1, Integer.parseInt(pdeptno));

        rs = pstmt.executeQuery();

        while (rs.next()) {

            EmpVO evo = EmpVO.builder()
                    .empno(rs.getInt("empno"))
                    .ename(rs.getString("ename"))
                    .job(rs.getString("job"))
                    .mgr(rs.getInt("mgr"))
                    .hiredate(
                        rs.getDate("hiredate")
                           .toLocalDate()
                           .atStartOfDay()
                    )
                    .sal(rs.getDouble("sal"))
                    .comm(rs.getDouble("comm"))
                    .deptno(rs.getInt("deptno"))
                    .build();

            elist.add(evo);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {

        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<%
    for (EmpVO emp : elist) {
%>

<tr>
    <td><%= emp.getEmpno() %></td>
    <td><%= emp.getEname() %></td>
    <td><%= emp.getJob() %></td>
    <td><%= emp.getMgr() %></td>
    <td><%= emp.getHiredate() %></td>
    <td><%= emp.getSal() %></td>
    <td><%= emp.getComm() %></td>
    <td><%= emp.getDeptno() %></td>
</tr>

<%
    }
%>