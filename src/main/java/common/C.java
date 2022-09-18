package common;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.FileDTO;
import domain.UserDTO;

public class C {
	public static final Integer WRITE_PAGES = 10; 
	public static final Integer PAGE_ROWS = 10;
	
   public static final String REDIRECT_ATTR_NAME = "REDIRECT_ATTR";
   public static final String PRINCIPAL = "PRINCIPAL";
   public static final String URL_PRIOR = "URL_PRIOR";
   public static void addRedirectAttribute(HttpServletRequest request, String name, Object value) {
      if(request == null || name == null || value == null) return;
      
      HttpSession session = request.getSession();
      
      HashMap<String, Object> redirectAttr = (HashMap<String, Object>)session.getAttribute(REDIRECT_ATTR_NAME);
      if(redirectAttr == null) {
         redirectAttr = new HashMap<String, Object>();
         session.setAttribute(REDIRECT_ATTR_NAME, redirectAttr);
      }
      
      redirectAttr.put(name, value);
   } // end addRedirectAttribute()
   
   public static void retrieveRedirectAttribute(HttpServletRequest request) {
      if(request == null) return;
      HttpSession session = request.getSession();
      
      HashMap<String, Object> redirectAttr = (HashMap<String, Object>)session.getAttribute(REDIRECT_ATTR_NAME);
      
      if(redirectAttr == null) return;
      
      request.setAttribute(REDIRECT_ATTR_NAME, redirectAttr);
      
      session.removeAttribute(REDIRECT_ATTR_NAME);
   }
   
   
   // securityCheck 를 통과하면 true 아니면 false 를 리턴
   public static boolean securityCheck(
   		HttpServletRequest request,
   		HttpServletResponse response,
   		String [] authorities   // 접근에 필요한 권한 혹은 권한들
   		) throws IOException {
   	
   	String conPath = request.getContextPath();
   	
   	// 원래 가고자 했던 url
   	String qry = request.getQueryString();
   	String url_prior = request.getRequestURL() + ((qry != null) ? "?" + qry : "");
   	
   	// 로그인(인증) 되었을 user 객체 가져오게 함
   	HttpSession session = request.getSession();
   	UserDTO user = (UserDTO)session.getAttribute(PRINCIPAL);
   	
		// 로그인이 되어 있지 않다면 
		// 로그인 페이지로 유도하고 로그인이 완료되면 URL_PRIOR 로 돌아오게 함
		if(user == null) {
			session.setAttribute(URL_PRIOR, url_prior);
			response.sendRedirect(conPath + "/user/login");
			return false;
		}
   	
		// 접근에 필요한 권한이 있는 경우
		if(authorities != null && authorities.length > 0) {
			String auths = user.getAuthorities();
			
			// 그런데 로그인한 사용자의 권한이 아예 없으면
			if(auths == null) {
				response.sendRedirect(conPath + "/user/rejectAuth");
				return false;
			}
			
			
			// 필요한 권한이 하나라도 있다면 ok
			for(String authority : authorities) {
				if(auths.indexOf(authority) > -1) {
					return true;
				}
			}
			
			response.sendRedirect(conPath + "/user/rejectAuth");
			return false;
		}
		
		return true;
   	
   } // end securityCheck()
   
   public static String retrieveUrlPrior(HttpServletRequest request) {
	   	HttpSession session = request.getSession();
	   	String urlPrior = (String)session.getAttribute(URL_PRIOR);
	   	session.removeAttribute(urlPrior);
	   	return urlPrior;
   }   
   
   public static int deleteFiles(List<FileDTO> list, HttpServletRequest request) {
   	int cnt = 0;  // 삭제 성공한 파일 개수
   	
   	if(list == null || list.size() == 0 || request == null) return cnt;
   	
		// 물리적인 경로
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");    
		
		for(FileDTO dto : list) {
			File f = new File(saveDirectory, dto.getFile_name());   // 물리적으로 저장된 파일들이 삭제 대상
			System.out.println("삭제시도--> " + f.getAbsolutePath());
			
			if(f.exists()) {
				if(f.delete()) {
					System.out.println("삭제 성공");
					cnt++;
				} else {
					System.out.println("삭제 실패");
				}
			} else {
				System.out.println("파일이 존재하지 않습니다");
			}
		}
   	
   	
   	return cnt;
   } // end deleteFiles()
}// end class