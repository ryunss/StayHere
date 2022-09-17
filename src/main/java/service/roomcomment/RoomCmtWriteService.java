package service.roomcomment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.QnACommentDAO;
import domain.RoomCommentDAO;
import domain.RoomCommentDTO;
import domain.RoomDTO;
import domain.RoomQryResult;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RoomCmtWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int roomNum = Integer.parseInt(request.getParameter("room_num"));
		int userNum	= Integer.parseInt(request.getParameter("user_num"));
		String content = request.getParameter("content");
		
		RoomDTO room = new RoomDTO();
		room.setNum(roomNum);
		UserDTO user = new UserDTO();
		user.setUser_num(userNum);
		
		RoomCommentDTO dto = RoomCommentDTO.builder()
				.room(room)
				.user(user)
				.rc_content(content)
				.build();
		
		RoomQryResult obj = new RoomQryResult();
		ObjectMapper mapper = new ObjectMapper();
		
		
			SqlSession sqlSession = null;
			RoomCommentDAO dao = null;
			int cnt = 0;
			
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(RoomCommentDAO.class);
			
			cnt = dao.insert(dto);
			obj.setCount(cnt);
			obj.setStatus("OK");
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			obj.setStatus("댓글 작성 ERROR: " + e.getMessage());
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		String output = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj); //포맷팅
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(output);
	}

}
