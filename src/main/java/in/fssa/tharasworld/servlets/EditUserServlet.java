package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.List;

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

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/user/edit")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		RequestDispatcher rd = request.getRequestDispatcher("/edit_user.jsp");
//		
//		rd.forward(request, response);
		
	//	String userId = request.getParameter("id");
		
		try {

			HttpSession session = request.getSession();
			
			Integer userId = (Integer) session.getAttribute("userId");
			
			UserEntity user = UserService.findById(userId);
	       
			AddressEntity address = AddressService.findByDefault(userId);
						
			request.setAttribute("address", address);
						
			request.setAttribute("editUser", user);
			
			request.setAttribute("userId", userId);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/edit_user.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} 
	}


}
