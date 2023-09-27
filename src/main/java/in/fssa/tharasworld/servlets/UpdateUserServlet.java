package in.fssa.tharasworld.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.tharasworld.entity.AddressEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.AddressService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserEntity user = new UserEntity();
		
		AddressEntity address = new AddressEntity();
		
		int userId=0;
		UserEntity returnUser = null;
		
		try {
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			user.setName(request.getParameter("name"));
		}
/*		
		if(request.getParameter("password") == null || request.getParameter("password").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			user.setPassword(request.getParameter("password"));
		} */
		
		user.setAge(Integer.parseInt(request.getParameter("age")));
	
		user.setRole(request.getParameter("role"));
		
		HttpSession session = request.getSession();
		
		 userId = (Integer) session.getAttribute("userId");	
		
		UserService userService = new UserService();
		returnUser = UserService.findById(userId);
		
		
		userService.update(userId, user);
		
		response.sendRedirect(request.getContextPath()+"/category_list");
		
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
			request.setAttribute("errorMessage", e.getMessage());
			   
			request.setAttribute("editUser", returnUser);
			request.setAttribute("userId", userId);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/edit_user.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
