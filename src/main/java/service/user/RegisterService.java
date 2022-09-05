package service.user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionManager;

import domain.UserDAO;
import service.Service;

public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SqlSession sqlSession = null;
		UserDAO dao = null;

		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

	}
}
