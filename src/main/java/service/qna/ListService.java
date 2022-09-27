package service.qna;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.QnADAO;
import domain.QnADTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int page = 1;
		String pageParam = request.getParameter("page");
		if(pageParam != null && !pageParam.trim().equals("")) {
			try {
				page = Integer.parseInt(pageParam);
			} catch(NumberFormatException e) {
				
			}
		}
		
		
		String keywordF = request.getParameter("searchField");
		String keyword = request.getParameter("keyword");
		
		
		HttpSession session = request.getSession();
		Integer writePages = (Integer)session.getAttribute("writePages");
		if(writePages == null) writePages = C.WRITE_PAGES;
		Integer pageRows = (Integer)session.getAttribute("pageRows");
		if(pageRows == null) pageRows = C.PAGE_ROWS;
		
		int cnt = 0;
		int totalPage = 0;
		
		
		SqlSession sqlSession = null;
		QnADAO dao = null;
		
		List<QnADTO> list = null;
		
		int startPage = 1;
		int endPage = 10;
		
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnADAO.class);
			
			
			
			cnt = dao.countAll();
			totalPage = (int)Math.ceil(cnt / (double)pageRows);
			
			if(page < 1) page = 1;
			if(page > totalPage) page = totalPage;
			
			int fromRow = (page - 1) * pageRows;
			list = dao.selectFormRow(fromRow, pageRows);
			
			startPage = ((int)((page - 1 )/ writePages) * writePages) + 1;
			endPage = startPage + writePages - 1;
			if(endPage >= totalPage) endPage = totalPage;
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		request.setAttribute("list", list);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("writePages", writePages);
		request.setAttribute("pageRows", pageRows);
		session.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("url", request.getRequestURI());
	}//end execute
}//end Service
