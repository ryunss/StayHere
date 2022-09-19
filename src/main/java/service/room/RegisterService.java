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

public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String category = request.getParameter("category");
		String summary = request.getParameter("summary");
		String info = request.getParameter("info");
		String region = request.getParameter("region");
		int personnel = Integer.parseInt(request.getParameter("personnel"));
		int price = Integer.parseInt(request.getParameter("price"));
		String image = request.getParameter("image");
		String summary = request.getParameter("summary");

		RoomDTO dto = new RoomDTO();
		dto.setName(name);
		dto.setAddress(address);
		dto.setCategory(category);
		dto.setSummary(summary);
		dto.setInfo(info);
		dto.setRegion(region);
		dto.setPersonnel(personnel);
		dto.setPrice(price);
		dto.setImage(image);
		dto.setSummary(summary);
		int cnt = 0;
		
		SqlSession sqlSession = null;
		RoomDAO dao = null;		
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomDAO.class);
			cnt = dao.insert(dto);
			System.out.println("숙소등록 성공 : "+ cnt);
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);

	}

}
