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
			
			String idParams = request.getParameter("id");
			
			int id = Integer.parseInt(idParams);
			
			userService.delete(id); 
			
			response.sendRedirect(request.getContextPath() + "/user_records");
			
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}

}
