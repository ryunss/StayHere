package domain;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface FileDAO {
	
	/**
     * 특정 글(writeId) 에 첨부파일(들) 추가 INSERT
     * 글 insert, update 시 사용됨.
     * @param list :  Map<String, Object> 들의 List
     *                      ↓        ↓
     *                   <"source",원본파일명>
     *                   <"file", 저장된파일명>
     * @param writeId : 첨부될 글
     * @return : DML 수행 결과값
     */
	
	public int insert(List<Map<String, Object>> list, int qna_num) throws SQLException;
	
	// 특정 글의 첨부파일 읽어오기
	public List<FileDTO> selectFileByQnA(int qna_num) throws SQLException;
}
