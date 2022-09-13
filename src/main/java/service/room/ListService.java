package service.room;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.RoomDAO;
import domain.RoomDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SqlSession sqlSession = null;
		RoomDAO dao = null;
		
		List<RoomDTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomDAO.class);
			
			list = dao.select();
			
			request.setAttribute("list", list);
			
			sqlSession.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}
	}

}
