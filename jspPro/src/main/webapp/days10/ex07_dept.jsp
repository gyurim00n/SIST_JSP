<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page trimDirectiveWhitespaces="true"
         contentType="application/json; charset=UTF-8"
         pageEncoding="UTF-8"%>
         
<%
Connection conn = null;
PreparedStatement pstmt = null; 
ResultSet  rs   = null; 
ArrayList<DeptVO> dlist = null;
DeptVO  dvo = null;
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