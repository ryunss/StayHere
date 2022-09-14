package service.room;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.RoomDAO;
import domain.RoomDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class UpdateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String info = request.getParameter("info");
		
		SqlSession sqlSession = null;
		RoomDAO dao = null;
		
		int cnt = 0;
		RoomDTO dto = new RoomDTO();
		dto.setNum(num);
		dto.setImage(image);
		dto.setName(name);
		dto.setInfo(info);
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomDAO.class);
			
			cnt = dao.update(dto);
			
			sqlSession.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}

		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}

}
