package domain;

import java.sql.SQLException;
import java.util.List;

public interface QnADAO {
	
	//새 QnA게시물 작성
	public int insert(QnADTO dto) throws SQLException;
	
	//QnA 목록
	public List<QnADTO> select() throws SQLException;
	
	//페이징
	public List<QnADTO> selectFormRow(int from, int rows) throws SQLException;
	
	//전체 글 개수
	public int countAll() throws SQLException;
}
