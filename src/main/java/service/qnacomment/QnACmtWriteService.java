package service.qnacomment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.QnACommentDAO;
import domain.QnACommentDTO;
import domain.QnADTO;
import domain.QnAQryResult;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class QnACmtWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int qnaNum = Integer.parseInt(request.getParameter("qna_num"));
		int userNum	= Integer.parseInt(request.getParameter("user_num"));
		String content = request.getParameter("content");
		
		QnADTO qna = new QnADTO();
		qna.setQna_num(qnaNum);
		UserDTO user = new UserDTO();
		user.setUser_num(userNum);
		
		QnACommentDTO dto = QnACommentDTO.builder()
				.qna_num(qna)
				.user_num(user)
				.qc_content(content)
				.build();
		
		QnAQryResult obj = new QnAQryResult();
		ObjectMapper mapper = new ObjectMapper();
		
		
			SqlSession sqlSession = null;
			QnACommentDAO dao = null;
			int cnt = 0;
			
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnACommentDAO.class);
			
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
		response.setContentType("application.json; charset=utf-8");
		response.getWriter().write(output);
	}
}
