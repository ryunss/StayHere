package service.qnacomment;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.QnACommentDAO;
import domain.QnACommentDTO;
import domain.QnAQryCommentList;
import service.Service;
import sqlmapper.SqlSessionManager;


public class QnACmtListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qna_num
		int num = Integer.parseInt(request.getParameter("qna_num"));
		
		QnAQryCommentList obj = new QnAQryCommentList();
		ObjectMapper mapper = new ObjectMapper();
		
		SqlSession sqlSession = null;
		QnACommentDAO dao = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnACommentDAO.class);
			
			List<QnACommentDTO> list = dao.selectByQnA(num);
			obj.setList(list);
			obj.setCount(list.size());
			obj.setStatus("OK");
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			obj.setStatus("댓글목록 ERROR: " + e.getMessage());
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		String output = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
		response.setContentType("application.json; charset=utf-8");
		response.getWriter().write(output);
	}
}
