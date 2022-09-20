package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.UserDAO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class LoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username"); // 유저 ID
		String password = request.getParameter("password"); // 유저 PW

		String conPath = request.getContextPath();

		username = username.trim();
		password = password.trim();

		UserDTO dto = new UserDTO();
		dto.setUser_id(username.toUpperCase());

		SqlSession sqlSession = null;
		UserDAO dao = null;
		
		
		

		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			

			List<UserDTO> list = dao.selectByUsername(dto);
			if(list.size() == 0) {				
				C.addRedirectAttribute(request, "error", "존재하지 않는 아이디입니다");
				C.addRedirectAttribute(request, "username", username);								
				response.sendRedirect(conPath + "/user/login");
				return;
			}

			dto = list.get(0);
			if(!dto.getUser_password().equals(password)) {
				C.addRedirectAttribute(request, "error", "비밀번호가 일치하지 않습니다");
				C.addRedirectAttribute(request, "username", username);								
				response.sendRedirect(conPath + "/user/login");
				return;
			}
			
			// 로그인 진행
			HttpSession session = request.getSession();
			session.setAttribute(C.PRINCIPAL, dto);
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

	}

}
