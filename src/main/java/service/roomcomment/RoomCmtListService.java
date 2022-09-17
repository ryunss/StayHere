package service.roomcomment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.RoomCommentDAO;
import domain.RoomCommentDTO;
import domain.RoomQryCommentList;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RoomCmtListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		RoomQryCommentList obj = new RoomQryCommentList();
		ObjectMapper mapper = new ObjectMapper();
		
		SqlSession sqlSession = null;
		RoomCommentDAO dao = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomCommentDAO.class);
			
			List<RoomCommentDTO> list = dao.selectByRoom(num);
			obj.setList(list);
			obj.setCount(list.size());
			obj.setStatus("OK");
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			obj.setStatus("댓글 목록 ERROR: " + e.getMessage());
		} finally {
			if(sqlSession != null) sqlSession.close();
		}

		String output = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(output);

	}

}
