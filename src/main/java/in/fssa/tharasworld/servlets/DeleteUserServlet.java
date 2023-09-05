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
				String stringId = request.getParameter("id");
				HttpSession session = request.getSession(false);
				if (session != null) {
				    session.setAttribute("userId", 0);
				    Object userIdAttribute = session.getAttribute("userId");
				    System.out.println("userIdAttribute: " + userIdAttribute);
				    session.invalidate();
				}
			
				if (stringId != null && !stringId.isEmpty()) {
					int id = Integer.parseInt(stringId);
					userService.delete(id);
					response.sendRedirect(request.getContextPath() + "/index.jsp");
				}

				
//			String idParams = request.getParameter("id");
//			
//			int id = Integer.parseInt(idParams);
//			
//			userService.delete(id); 
//			
//			response.sendRedirect(request.getContextPath() + "/user_records");
			
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}

}
