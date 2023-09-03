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

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/user_login.jsp");
		rd.forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		    Long phoneNumber = Long.parseLong(request.getParameter("phone_number"));
		    String password = request.getParameter("password");
		    UserService userService = new UserService();
		    UserEntity user = userService.checkUserExistsWithPhoneNumber(phoneNumber);

		    if (user == null) {
		        System.out.println("User not found");
		    } else if (!password.equals(user.getPassword())) {
		        System.out.println("Incorrect Phone number or Password:(");
		    } else {
		        System.out.println("Login Successfull:)");
	            int id = user.getId();
	            request.getSession().setAttribute("userId", id); 
	            response.sendRedirect(request.getContextPath() + "/category_list");
		    }
           
		} catch (ServiceException e) {
		    e.printStackTrace();
		} catch (ValidationException e) {
		    e.printStackTrace();
		}
	}

}
