package domain;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {

	List<UserDTO> selectByUsername(UserDTO dto) throws SQLException;
	

	List<UserDTO> selectById(UserDTO dto) throws SQLException;
	
	List<UserDTO> selectSearch(UserDTO dto) throws SQLException;

	int register(UserDTO dto) throws SQLException;



	
}
