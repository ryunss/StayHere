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
import service.user.LoginService;
import service.user.RegisterService;
import service.user.businessService;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		action(request, response);
	}

	protected void action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		switch (command) {
		case "/user/register":
			switch (method) {
			case "GET":
				C.retrieveRedirectAttribute(request);
				viewPage = "/user/register.jsp";
				break;
			case "POST":
				service = new RegisterService();
				service.execute(request, response);
				if (!response.isCommitted())
					viewPage = "/user/registerOk.jsp";
				break;
			}
			break;
		case "/user/business":
			switch (method) {
			case "GET":
				C.retrieveRedirectAttribute(request);
				viewPage = "/user/business.jsp";
				break;
			case "POST":
				service = new businessService();
				service.execute(request, response);
				if (!response.isCommitted())
					viewPage = "/user/registerOk.jsp";
				break;
			}
			break;
		case "/user/login":
			switch (method) {
			case "GET":
				C.retrieveRedirectAttribute(request);
				viewPage = "/user/login.jsp";
				break;
			case "POST":
				service = new LoginService();
				service.execute(request, response);
				if (!response.isCommitted()) {
					String redirectUrl = request.getContextPath() + "/home";

					response.sendRedirect(redirectUrl);
				}
				break;
			}
			break;
		case "/user/logout":
			if (method.equals("POST")) {
				request.getSession().removeAttribute(C.PRINCIPAL);
				response.sendRedirect(request.getContextPath() + "/home");
			}
			break;
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views" + viewPage);

			dispatcher.forward(request, response);
		}
	}

}
