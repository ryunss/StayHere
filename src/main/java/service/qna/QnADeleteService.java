package service.qna;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.FileDAO;
import domain.FileDTO;
import domain.QnADAO;
import domain.QnADTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class QnADeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("qna_num"));
		
		SqlSession sqlSession = null;
		QnADAO dao = null;
		FileDAO fileDao = null;
		
		int cnt = 0;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnADAO.class);
			fileDao = sqlSession.getMapper(FileDAO.class);
		
			List<FileDTO> fileList = fileDao.selectFileByQnA(num);
			C.deleteFiles(fileList, request);
			
			UserDTO loggedUser = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
			List<QnADTO> list = dao.selectByNum(num);
			UserDTO writeUser = list.get(0).getUser_num();
			if(loggedUser.getUser_num() != writeUser.getUser_num()) {
				response.sendRedirect(request.getContextPath() + "/user/rejectAuth");
				return;
			}
			
			cnt = dao.deleteByNum(num);
			
			sqlSession.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		request.setAttribute("result", cnt);
	}

}
