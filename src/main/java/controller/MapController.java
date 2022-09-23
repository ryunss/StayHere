package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/map")
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public MapController() {
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

		String viewPage = null;
		
		switch (command) {
		case "/map":
			viewPage = "mapView.jsp";
			break;

		}
		

		if (viewPage != null) {
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/map/mapView.jsp");

			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

	}
}
