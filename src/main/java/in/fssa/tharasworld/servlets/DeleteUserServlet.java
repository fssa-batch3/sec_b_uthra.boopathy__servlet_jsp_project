package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/user/delete")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserEntity user = new UserEntity();
		
		try {
			
				UserService userService = new UserService();
				
				HttpSession session = request.getSession(false);
				
				int stringId = (Integer) session.getAttribute("userId");
				
				if (session != null) {
				    session.setAttribute("userId", 0);
				    Object userIdAttribute = session.getAttribute("userId");
				    System.out.println("userIdAttribute: " + userIdAttribute);
				    session.invalidate();
				}
			
			
			userService.delete(stringId); 
			
			response.sendRedirect(request.getContextPath() + "/index");
			
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
		} 
		
	}

}
