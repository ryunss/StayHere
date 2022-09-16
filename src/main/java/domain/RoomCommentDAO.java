package domain;

import java.sql.SQLException;
import java.util.List;

public interface RoomCommentDAO {
	List<RoomCommentDTO> selectByRoom(int room_num) throws SQLException;
	
	public int insert(RoomCommentDTO dto) throws SQLException;
	
	public int deleteByNum(int rc_num) throws SQLException;
}
