package service.roomcomment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.QnACommentDAO;
import domain.RoomCommentDAO;
import domain.RoomQryResult;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RoomCmtDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		RoomQryResult obj = new RoomQryResult();
		ObjectMapper mapper = new ObjectMapper();
		
		SqlSession sqlSession = null;
		RoomCommentDAO dao = null;
		int cnt = 0;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomCommentDAO.class);
			
			cnt = dao.deleteByNum(num);
			
			obj.setCount(cnt);
			obj.setStatus("OK");
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			obj.setStatus("댓글 삭제 ERROR: " + e.getMessage());
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		String output = mapper.writeValueAsString(obj);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(output);
	}

}
