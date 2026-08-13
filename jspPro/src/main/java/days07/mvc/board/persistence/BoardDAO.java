package days07.mvc.board.persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import days07.mvc.board.domain.BoardDTO;



public interface BoardDAO {
	//1. 목록보기 + 페이징 처리X
	List<BoardDTO> select() throws SQLException;
	//1. 페이징처리완 
	List<BoardDTO> select(int currentPage, int pageSize) throws SQLException;

	
	int getNextSeq() throws SQLException;
	int insert(BoardDTO dto) throws SQLException; //0, 1 성공, 실패

	//3.조회수 증가
	int increaseReaded(long seq) throws SQLException;
	//3-2상세보기
	BoardDTO view(long seq)throws SQLException;

	//4.삭제
	int delete(long seq, String pwd)throws SQLException;

	//5. 수정
	int update(BoardDTO dto) throws SQLException;

	List<BoardDTO> search(String searchCondition, String searchKeyword) throws SQLException;
	List<BoardDTO> search(String searchCondition, String searchKeyword, int currentPage, int pageSize) throws SQLException;
	
	//7.전체 페이지수 
	int getTotalPages(int pageSize) throws SQLException;
	int getTotalPages(int pageSize, String searchCondition, String searchKeyword)throws SQLException;
	
	
}
