package service.qna;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import domain.FileDAO;
import domain.FileDTO;
import domain.QnADAO;
import domain.QnADTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class DetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session = request.getSession();
		Integer page = (Integer)session.getAttribute("page");
		if(page == null) page = 1;
		request.setAttribute("page", page);
		
		SqlSession sqlSession = null;
		QnADAO dao = null;
		FileDAO fileDao = null;
		
		List<QnADTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnADAO.class);
			fileDao = sqlSession.getMapper(FileDAO.class);
			
			list = dao.selectByNum(num);
			
			if(list != null && list.size() == 1) {
				List<FileDTO> fileList = fileDao.selectFileByQnA(num);
				
				String realPath = request.getServletContext().getRealPath("upload");
				
				for(FileDTO fileDto : fileList) {
					File f = new File(realPath, fileDto.getFile_name());
					BufferedImage imgData = null;
					try {
						imgData = ImageIO.read(f);
					} catch (IOException e) {
						System.out.println("파일미확인: " + f.getAbsolutePath() + "[" + e.getMessage() + "]");
					}
					if(imgData != null) fileDto.setImage(true);
				}//end for
				request.setAttribute("fileList", fileList);
			}
			request.setAttribute("list", list);
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
	}

}
