package service.qnacomment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import domain.QnACommentDAO;
import domain.QnAQryResult;
import service.Service;
import sqlmapper.SqlSessionManager;

public class QnACmtDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//댓글 번호
		int num = Integer.parseInt(request.getParameter("qc_num"));
		
		QnAQryResult obj = new QnAQryResult();
		ObjectMapper mapper = new ObjectMapper();
		
		SqlSession sqlSession = null;
		QnACommentDAO dao = null;
		int cnt = 0;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnACommentDAO.class);
			
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
