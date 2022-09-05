package service.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.UserDAO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re-password");
        String name = request.getParameter("name");
        
		username = username.trim();
		password = password.trim();
		re_password = re_password.trim();
		name = name.trim();
		
		SqlSession sqlSession = null;
		UserDAO dao = null;

		int cnt = 0;
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			
			sqlSession.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}

}
