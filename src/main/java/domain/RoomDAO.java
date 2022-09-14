package domain;

import java.sql.SQLException;
import java.util.List;

public interface RoomDAO {
	// 숙소 전체 SELECT
	public abstract List<RoomDTO> select() throws SQLException;
		
	// 숙소 등록
	public abstract int insert(RoomDTO dto) throws SQLException;
	
	// 특정 num 숙소 정보
	public abstract List<RoomDTO> selectByNum(int num) throws SQLException;
	
	// 특정 num 숙소 조회수
	public abstract int incViewCnt(int num) throws SQLException;
	
	// 특정 num 숙소 수정
	public abstract int update(RoomDTO dto) throws SQLException;
	
	// 특정 num 숙소 삭제
	public abstract int deleteByNum(int num) throws SQLException;
}
