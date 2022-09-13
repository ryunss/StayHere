package service.qna;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.C;
import domain.FileDAO;
import domain.FileDTO;
import domain.QnADAO;
import domain.QnADTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class UpdateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
	    System.out.println("업로드 경로: " + saveDirectory);
	    
	    int maxPostSize = 5 * 1024 * 1024;
	    String encoding = "utf-8";
	    FileRenamePolicy policy = new DefaultFileRenamePolicy();
	    MultipartRequest multi = null;
	    
	    multi = new MultipartRequest(
	    		request,
	    		saveDirectory,
                maxPostSize,
                encoding,
                policy
                );
	    
	    List<Map<String, Object>> nameList = new ArrayList<>();
	    Enumeration names = multi.getFileNames();
	    
	    while(names.hasMoreElements()){    
            String name = (String)names.nextElement();
            if(name.startsWith("upfile")) {  // name="upfile##" 인 경우만 첨부파일 등록, (다른 웹 에디터와 섞이지 않도록)              
                String originalFileName = multi.getOriginalFileName(name);  // 원본 이름
                String fileSystemName = multi.getFilesystemName(name);  // 저장된(rename)된 이름
                System.out.println("첨부파일(" + name + "): " + originalFileName + "->" + fileSystemName);
               
                if(originalFileName != null && fileSystemName != null) {
                    // Map.of(k1, v1, k2, v2 ..) 로 Map 객체 생성   (Java9 에서 추가)
                    nameList.add(Map.of("source", originalFileName, "file", fileSystemName));
                }
            }
        }
	    
	    String [] delFiles = multi.getParameterValues("delfile");
	    int [] delFileNums = null;
	    if(delFiles != null && delFiles.length > 0) {
        	// String [] -> int [] 변환
        	delFileNums = new int[delFiles.length];
        	for(int i = 0; i < delFiles.length; i++) {
        		delFileNums[i] = Integer.parseInt(delFiles[i]);
        	}        	
        }
	    
	    int num = Integer.parseInt(multi.getParameter("num"));
		String subject = multi.getParameter("qna_subject");
		String content = multi.getParameter("qna_content");
		
		SqlSession sqlSession = null;
		QnADAO dao = null;		
		FileDAO fileDao = null;
		
		int cnt = 0;
		List<FileDTO> fileList = null;
		
		QnADTO dto = QnADTO.builder()
				.qna_num(num)
				.qna_subject(subject)
				.qna_content(content)
				.build()
				;
		

		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(QnADAO.class);
			fileDao = sqlSession.getMapper(FileDAO.class);
			
            // 4. 삭제 선택한 첨부파일 삭제
            if(delFileNums != null && delFileNums.length > 0) {
                fileList = fileDao.selectByNums(delFileNums);
                // 물리적인 파일 삭제
                C.deleteFiles(fileList, request);
                // DB 에서 파일 삭제
                fileDao.deleteByNums(delFileNums);
            }
            
            // 5. 추가된 파일들은 DB에 저장하기
            if(nameList != null && nameList.size() > 0) {              
                fileDao.insert(nameList, num);
            }

			// 6. 글 수정
			cnt = dao.updateQnA(dto);
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}

}
