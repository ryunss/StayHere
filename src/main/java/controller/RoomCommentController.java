package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.roomcomment.RoomCmtDeleteService;
import service.roomcomment.RoomCmtListService;
import service.roomcomment.RoomCmtWriteService;

@WebServlet("/roomcomment/*")
public class RoomCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomCommentController() {
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
		System.out.println("\n>> " + getClass().getName() + ".action() 호출");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		// request method
		String method = request.getMethod();

		System.out.println("request: " + uri + " (" + method + ")");  
		System.out.println("conPath: " + conPath);  
		System.out.println("command: " + command);
		
		switch(command) {
		case "/roomcomment/list":
			new RoomCmtListService().execute(request, response);
			break;
			
		case "/roomcomment/write":
			if(method.equals("POST")) {
				new RoomCmtWriteService().execute(request, response);
			}
			break;
		
		case "/roomcomment/delete":			
			if(method.equals("POST")) {
				new RoomCmtDeleteService().execute(request, response);
			}
			break;
			
		} // end switch
			
	} // end action()

} // end Controller

