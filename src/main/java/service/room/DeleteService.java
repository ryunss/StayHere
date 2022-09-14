package service.room;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.RoomDAO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class DeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		SqlSession sqlSession = null;
		RoomDAO dao = null;
		
		int cnt = 0;
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomDAO.class);
			
			cnt = dao.deleteByNum(num);
			
			sqlSession.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}

		request.setAttribute("result", cnt);
	}

}
