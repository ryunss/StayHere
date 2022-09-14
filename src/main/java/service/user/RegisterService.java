package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;


import common.C;
import domain.UserDAO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username"); // 유저 ID
		String password = request.getParameter("password"); // 유저 PW
		String re_password = request.getParameter("re-password");
		String name = request.getParameter("name"); // 유 이름
		String authorities = request.getParameter("authorities"); // 권한

		username = username.trim();
		password = password.trim();
		re_password = re_password.trim();
		name = name.trim();
//		authorities = authorities.trim();

		String conPath = request.getContextPath();
		
		
		String pwpattern = "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$";
		
		Matcher matcher1 = Pattern.compile(pwpattern).matcher(password);
		
		if(!matcher1.matches()) {
			C.addRedirectAttribute(request, "error", "비밀번호는 영문(대소문자 구분), 숫자, 특수문자 조합, 9~12자리이어야 합니다");
			C.addRedirectAttribute(request, "username", username);
			C.addRedirectAttribute(request, "name", name);

			response.sendRedirect(conPath + "/user/register");

			return;
		}


		
		if (!password.equals(re_password)) {

			C.addRedirectAttribute(request, "error", "비밀번호가 일치하지 않습니다");
			C.addRedirectAttribute(request, "username", username);
			C.addRedirectAttribute(request, "name", name);

			response.sendRedirect(conPath + "/user/register");

			return;
		}
		
		if(password.length() < 8) {
			C.addRedirectAttribute(request, "error", "비밀번호는 8자 이상이어야 합니다");
			C.addRedirectAttribute(request, "username", username);
			C.addRedirectAttribute(request, "name", name);
			
			response.sendRedirect(conPath + "/user/register");
		}

		SqlSession sqlSession = null;
		UserDAO dao = null;

		int cnt = 0;

		UserDTO dto = UserDTO.builder()
				.user_name(name)
				.user_id(username.toUpperCase())
				.user_password(password)
				.authorities(authorities)
				.build();
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			List<UserDTO> list = dao.selectByUsername(dto);
			if (list.size() > 0) {
				C.addRedirectAttribute(request, "error", "이미 존재하는 아이디 입니다");
				C.addRedirectAttribute(request, "username", username);
				C.addRedirectAttribute(request, "name", name);

				response.sendRedirect(conPath + "/user/register");

				return;
			}
			cnt = dao.register(dto);
			sqlSession.commit();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}

}
