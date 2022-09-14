package domain;

import java.sql.SQLException;
import java.util.List;

public interface QnADAO {
	
	//새 QnA게시물 작성
	public int insert(QnADTO dto) throws SQLException;
	
	//QnA 목록
	public List<QnADTO> select() throws SQLException;
	
	//특정 num 글 읽어오기
	public List<QnADTO> selectByNum(int qna_num) throws SQLException;
	
	//QnA 수정
	public int updateQnA(QnADTO dto) throws SQLException;
	
	//QnA 삭제
	public int deleteByNum(int qna_num) throws SQLException;
	
	//페이징
	public List<QnADTO> selectFormRow(int from, int rows) throws SQLException;
	
	//전체 글 개수
	public int countAll() throws SQLException;
	
	
}
