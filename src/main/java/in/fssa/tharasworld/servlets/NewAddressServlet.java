package in.fssa.tharasworld.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class NewAddressServlet
 */
@WebServlet("/address/new")
public class NewAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer) session.getAttribute("userId");
			
			UserEntity user = UserService.findById(userId);
			
			System.out.println(user.toString());
			
			request.setAttribute("userDetails", user);
			
			request.setAttribute("userId", userId);
			
			RequestDispatcher rd = request.getRequestDispatcher("/add_address.jsp");
			
			rd.forward(request, response);
			
		
		} catch (ServiceException | ValidationException e) {

			e.printStackTrace();
		
		}

	}
}
