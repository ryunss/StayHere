package service.qna;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.FileDAO;
import domain.FileDTO;
import domain.QnADAO;
import domain.QnADTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class SelectService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session =request.getSession();
		Integer page = (Integer)session.getAttribute("page");
		if(page == null) page = 1;
		request.setAttribute("page", page);
		
		SqlSession sqlSession = null;
		QnADAO dao = null;	
		FileDAO fileDao = null;
		
		List<QnADTO> list = null;
		List<FileDTO> fileList = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnADAO.class);
			fileDao = sqlSession.getMapper(FileDAO.class);
			
			list = dao.selectByNum(num);
			fileList = fileDao.selectFileByQnA(num);
			
			UserDTO loggedUser = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
			UserDTO qnaUser = list.get(0).getUser_num();
			if(loggedUser.getUser_num() != qnaUser.getUser_num()) {
				response.sendRedirect(request.getContextPath() + "/user/rejecAuth");
				return;
			}
			
			request.setAttribute("list", list);
			request.setAttribute("fileList", fileList);
			
			sqlSession.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
}
