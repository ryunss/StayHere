package domain;

import java.sql.SQLException;
import java.util.List;

public interface QnACommentDAO {
	
	//특정 qna_num의 댓글 읽어오기
	List<QnACommentDTO> selectByQnA(int qna_num) throws SQLException;
	
	//댓글 작성
	public int insert(QnACommentDTO dto) throws SQLException;
	
	//댓글 삭제
	public int deleteByNum(int qc_num) throws SQLException;
}
