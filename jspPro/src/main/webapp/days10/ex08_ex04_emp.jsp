<%@page import="java.sql.Connection"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="application/json; charset=UTF-8"%>

<%
    String pDeptno = request.getParameter("deptno");
    int deptno = Integer.parseInt(pDeptno);

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = """
        SELECT empno, ename, job, mgr,
               TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate,
               sal, comm, deptno
        FROM emp
        WHERE deptno = ?
        ORDER BY empno ASC
    """;

    StringBuilder json = new StringBuilder();

    json.append("{");
    json.append("\"employees\":[");

    try {

        conn = ConnectionProvider.getConnection();

        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, deptno);

        rs = pstmt.executeQuery();

        boolean first = true;

        while (rs.next()) {

            if (!first) {
                json.append(",");
            }

            first = false;

            int empno = rs.getInt("empno");
            String ename = rs.getString("ename");
            String job = rs.getString("job");
            int mgr = rs.getInt("mgr");
            String hiredate = rs.getString("hiredate");
            double sal = rs.getDouble("sal");
            double comm = rs.getDouble("comm");
            int dno = rs.getInt("deptno");

            json.append("{");

            json.append("\"empno\":").append(empno).append(",");
            json.append("\"ename\":\"").append(ename).append("\",");
            json.append("\"job\":\"").append(job).append("\",");
            json.append("\"mgr\":").append(mgr).append(",");
            json.append("\"hiredate\":\"").append(hiredate).append("\",");
            json.append("\"sal\":").append(sal).append(",");
            json.append("\"comm\":").append(comm).append(",");
            json.append("\"deptno\":").append(dno);

            json.append("}");
        }

        json.append("]");

        json.append("}");

        out.print(json.toString());

    } catch (Exception e) {

        e.printStackTrace();

    } finally {

        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>