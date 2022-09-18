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
	
	public int insert(List<Map<String, Object>> list, int num) throws SQLException;
	
	// 특정 글의 첨부파일 읽어오기
	public List<FileDTO> selectFileByQnA(int qna_num) throws SQLException;
	
	//특정 첨부파일 한개
	public List<FileDTO> selectByNum(int file_num) throws SQLException;
	
	//글 수정에서 선택한 첨부파일들 
	public List<FileDTO> selectByNums(int[] file_nums) throws SQLException;
	
	//글 삭제에서 선택한 첨부파일들
	public int deleteByNums(int [] file_nums) throws SQLException;
}
