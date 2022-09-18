package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;
import service.room.DeleteService;
import service.room.DetailService;
import service.room.ListService;
import service.room.RegisterService;
import service.room.SearchService;
import service.room.SelectService;
import service.room.UpdateService;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());

		String method = request.getMethod();

		System.out.println("reqeust: " + uri + " (" + method + ")");
		System.out.println("conPath: " + conPath);
		System.out.println("command: " + command);

		Service service = null;
		String viewPage = null;

		switch (command) {
		case "/home":
			service = new ListService();
			service.execute(request, response);
			viewPage = "home.jsp";
			break;

		}

		if (viewPage != null) {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");

			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

	}

}