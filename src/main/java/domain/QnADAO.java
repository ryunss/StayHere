package domain;

import java.sql.SQLException;

public interface QnADAO {
	
	//새 QnA게시물 작성
	public int insert(QnADTO dto) throws SQLException;
}
