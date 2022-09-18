package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.UserDAO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class SearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username"); // 유저 ID
		String password = request.getParameter("password"); // 유저 PW
		String name = request.getParameter("name"); // 유 이름
		
		
		username = username.trim();
		password = password.trim();
		name = name.trim();
		
		String conPath = request.getContextPath();
		
		SqlSession sqlSession = null;
		RoomDAO dao = null;
		
		List<RoomDTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			List<UserDTO> list = dao.selectSearch(dto);
			
			request.setAttribute("list", list);
			
			sqlSession.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}

	}

}
