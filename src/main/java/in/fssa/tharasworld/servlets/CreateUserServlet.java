package in.fssa.tharasworld.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/add_user.jsp");
		
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserEntity user = new UserEntity();
		
		try {
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			user.setName(request.getParameter("name"));
		}
		
		if(request.getParameter("email") == null || request.getParameter("email").isEmpty()) {
			Logger.info("Email cannot be null or empty");
		} else {
			user.setEmail(request.getParameter("email"));
		}

			user.setPhoneNumber(Long.parseLong(request.getParameter("phone_number")));
		
		if(request.getParameter("password") == null || request.getParameter("password").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			user.setPassword(request.getParameter("password"));
		}
		
			user.setAge(Integer.parseInt(request.getParameter("age")));

	
		user.setRole(request.getParameter("role"));
				
		UserService userService = new UserService();
		userService.create(user);
		
		response.sendRedirect(request.getContextPath()+"/user/login");
		
		} catch (ValidationException | ServiceException e) {

			Logger.error(e);
			
			request.setAttribute("errorMessage", e.getMessage());
			
			RequestDispatcher rd = request.getRequestDispatcher("/add_user.jsp");
			
			rd.forward(request, response);
		}
		
	}
}
