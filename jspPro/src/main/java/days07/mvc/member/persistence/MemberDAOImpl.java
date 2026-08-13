package days07.mvc.member.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import days07.mvc.board.domain.BoardDTO;
import days07.mvc.member.domain.MemberDTO;





public class MemberDAOImpl implements MemberDAO{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private MemberDTO mto = null;
	private ResultSet rs = null;

	// 생성자를 사용한 의존성 주입(DI)
	public MemberDAOImpl(Connection conn) {
		this.conn = conn;
	}

	// Getter
	public Connection getConn() {
		return conn;
	}

	// Setter를 사용한 의존성 주입(DI)
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public List<MemberDTO> select() throws SQLException {

		String sql = """
				SELECT *
				FROM member
				ORDER BY seq DESC
				""";
		List<MemberDTO> list = null;

		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();

		if ( this.rs.next() ) {
			list = new ArrayList<MemberDTO>();
			do {
				this.mto = MemberDTO.builder()
						.seq( this.rs.getInt("seq") )
						.id( this.rs.getString("id") )
						.name(this.rs.getString("name"))
						.passwd( this.rs.getString("password") )
						.role( this.rs.getString("role"))
						.build();
				list.add(mto);
			} while (this.rs.next());          
		} // if

		if( this.rs != null ) this.rs.close();
		if( this.pstmt != null ) this.pstmt.close();

		return list;
	}

	public MemberDTO login(String id, String passwd) throws SQLException {
	    String sql = """
	            SELECT seq, id, name, passwd, role
	            FROM member
	            WHERE id = ? AND passwd = ?
	            """;

	    MemberDTO dto = null;

	    try (PreparedStatement pstmt = this.conn.prepareStatement(sql)) {
	        pstmt.setString(1, id);
	        pstmt.setString(2, passwd);

	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                dto = MemberDTO.builder()
	                        .seq(rs.getInt("seq"))
	                        .id(rs.getString("id"))
	                        .name(rs.getString("name"))
	                        .passwd(rs.getString("passwd"))
	                        .role(rs.getString("role"))
	                        .build();
	            }
	        }
	    }
	    return dto; // 회원이 없으면 null 반환
	}



	/* 더 좋은 코딩..
   @Override
   public List<BoardDTO> select() throws SQLException {

       String sql = """
               SELECT seq,
                      title,
                      writer,
                      email,
                      writedate,
                      readed
                 FROM tbl_cstvsboard
                ORDER BY seq DESC
               """;

       List<BoardDTO> list = new ArrayList<>();

       try (
           PreparedStatement pstmt = conn.prepareStatement(sql);
           ResultSet rs = pstmt.executeQuery()
       ) {

           while (rs.next()) {

               BoardDTO dto = BoardDTO.builder()
                       .seq(rs.getInt("seq"))
                       .title(rs.getString("title"))
                       .writer(rs.getString("writer"))
                       .email(rs.getString("email"))
                       .writedate(rs.getDate("writedate"))
                       .readed(rs.getInt("readed"))
                       .build();

               list.add(dto);
           }
       }

       return list;
   }
	 */

}






