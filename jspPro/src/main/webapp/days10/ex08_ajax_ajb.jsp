<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pDeptno = request.getParameter("deptno");  
    int deptno = (pDeptno == null || pDeptno.trim().isEmpty()) ? 10 : Integer.parseInt(pDeptno);

    Connection conn = DBConn.getConnection();
    PreparedStatement pstmt = null; 
    ResultSet rs = null; 
    ArrayList<EmpVO> elist = null;

    String esql = "SELECT empno, ename, job, mgr, TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
                + "FROM emp WHERE deptno = ? ORDER BY deptno ASC";
   
    try {
        pstmt = conn.prepareStatement(esql);
        pstmt.setInt(1, deptno);
        rs = pstmt.executeQuery();
      
        if (rs.next()) {
            elist = new ArrayList<EmpVO>();
            do {
                EmpVO evo = EmpVO.builder()
                         .empno(rs.getInt("empno"))
                         .ename(rs.getString("ename"))
                         .job(rs.getString("job"))
                         .mgr(rs.getInt("mgr"))
                         .hiredate(rs.getDate("hiredate").toLocalDate().atStartOfDay())
                         .sal(rs.getDouble("sal"))
                         .comm(rs.getDouble("comm"))
                         .deptno(rs.getInt("deptno"))
                         .build(); 
                elist.add(evo);
            } while (rs.next());
        } 
    } catch (SQLException e) { e.printStackTrace();
    } finally {
        try { rs.close(); pstmt.close(); DBConn.close(); } catch (SQLException e) { }
    }   
%>
<%
   if( elist == null ){
%>
    <tr>
      <td colspan="9">사원이 존재하지 않습니다.</td>
    </tr>
<%      
   } else {
     for(EmpVO evo : elist){
%>
     <tr>
       <td><input type="checkbox" id="ckb-<%= evo.getEmpno() %>" data-empno="<%= evo.getEmpno() %>"></td>
       <td><%= evo.getEmpno() %></td>
       <td><%= evo.getEname() %></td>
       <td><%= evo.getJob() %></td>
       <td><%= evo.getMgr() %></td>
       <td><%= evo.getHiredate().toLocalDate() %></td>
       <td><%= evo.getSal() %></td>
       <td><%= evo.getComm() %></td>
       <td><%= evo.getDeptno() %></td>
     </tr>
<%       
     }
   }
%>