package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserEntity user = new UserEntity();
		
		try {
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			System.out.println("Name cannot be null or empty");
		} else {
			user.setName(request.getParameter("name"));
		}
		
		if(request.getParameter("email") == null || request.getParameter("email").isEmpty()) {
			System.out.println("Email cannot be null or empty");
		} else {
			user.setEmail(request.getParameter("email"));
		}
		
//		if(Long.parseLong(request.getParameter("phone_number"))<=0) {
//			System.out.println("Invalid phone number");
//		} else {
			user.setPhoneNumber(Long.parseLong(request.getParameter("phone_number")));
//		}
		
		if(request.getParameter("password") == null || request.getParameter("password").isEmpty()) {
			System.out.println("Name cannot be null or empty");
		} else {
			user.setPassword(request.getParameter("password"));
		}
		
//		if(Integer.parseInt(request.getParameter("phone_number"))<=12) {
//			System.out.println("Invalid age");
//		} else {
			user.setAge(Integer.parseInt(request.getParameter("age")));
//		}
	
		user.setRole(request.getParameter("role"));
		
		System.out.println(user.toString());
		
		UserService userService = new UserService();
		userService.create(user);
		
		response.sendRedirect(request.getContextPath()+"/user/login");
		
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}
}
