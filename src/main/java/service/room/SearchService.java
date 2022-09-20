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

public class SearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String region = request.getParameter("region");
		int personnel = Integer.parseInt(request.getParameter("personnel"));
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		
		SqlSession sqlSession = null;
		RoomDAO dao = null;
		
		List<RoomDTO> list = null;
		
		RoomDTO dto = new RoomDTO();
		dto.setRegion(region);
		dto.setPersonnel(personnel);
		dto.setCategory(category);
		dto.setPrice(price);
		
		System.out.println(dto);
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomDAO.class);
			
			list = dao.selectWhere(dto);
			
			request.setAttribute("list", list);
			
			sqlSession.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) sqlSession.close();
		}

	}

}
