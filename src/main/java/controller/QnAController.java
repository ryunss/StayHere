package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.C;
import service.Service;
import service.qna.DetailService;
import service.qna.ListService;
import service.qna.QnADeleteService;
import service.qna.QnADownloadService;
import service.qna.QnAWriteService;
import service.qna.SelectService;
import service.qna.UpdateService;

@WebServlet("/qna/*")
public class QnAController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnAController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}
	protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n >> " + getClass().getName() + ".action() 호출");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		// request method	
		String method = request.getMethod();

		// 매 request 마다 출력 (테스트)
		System.out.println("request: " + uri + " (" + method + ")");  
		System.out.println("conPath: " + conPath);  
		System.out.println("command: " + command);
		
		Service service = null;
		String viewPage = null;
		
		switch(command) {
		case "/qna/write":
			if(C.securityCheck(request, response, new String[] {"ROLE_MEMBER"})) {				
				switch(method) {
				case "GET":
					viewPage = "qnawrite.jsp";
					break;
				case "POST":
					service = new QnAWriteService();
					service.execute(request, response);
					viewPage = "qnaWriteOk.jsp";
					break;
				}
			}
			break;
		case "/qna/list":
			service = new ListService();
			service.execute(request, response);
			viewPage = "qnaList.jsp";
			break;
		
		case "/qna/detail":
			if(C.securityCheck(request, response, null)) {
				service = new DetailService();
				service.execute(request, response);
				viewPage = "qnaDetail.jsp";
			}
			break;
			
		case "/qna/update" :
			if(C.securityCheck(request, response, new String[] {"ROLE_MEMBER"})) {				
				switch(method) {
				case "GET":
					service = new SelectService();
					service.execute(request, response);
					
					if(!response.isCommitted()) {
						viewPage = "qnaUpdate.jsp";
					}
					break;
				case "POST" :
					service = new UpdateService();
					service.execute(request, response);
					viewPage = "qnaUpdateOk.jsp";
					break;
				}
			}
			break;
		
		case "/qna/delete":
			if(C.securityCheck(request, response, new String[] {"ROLE_MEMBER"} )) {
				switch(method) {
				case "POST":
					service = new QnADeleteService();
					service.execute(request, response);
					if(!response.isCommitted()) {
						viewPage = "qnaDeleteOk.jsp";
					}
				}
			}
			break;
			
		//페이징
		//pageRows 변경시 동작
		case "/qna/pageRows":
			int page = Integer.parseInt(request.getParameter("page"));
			Integer pageRows = Integer.parseInt(request.getParameter("pageRows"));
			request.getSession().setAttribute("pageRows", pageRows);
			response.sendRedirect(request.getContextPath() + "/qna/list?page=" + page);
			break;
			
		case "/qna/download":
			service = new QnADownloadService();
			service.execute(request, response);
			break;
		}
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/WEB-INF/views/qnaboard/" + viewPage);
			
			dispatcher.forward(request, response);
		}
	}
}