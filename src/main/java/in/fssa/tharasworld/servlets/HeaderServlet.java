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
 * Servlet implementation class HeaderServlet
 */
@WebServlet("/header")
public class HeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 try {
		        String idParam = request.getParameter("id");
		        int userId = -1; 

		        if (idParam != null && !idParam.isEmpty()) {
		            userId = Integer.parseInt(idParam);
		            System.out.println(userId);
		        }

		        if (userId > 0) {
		            UserEntity user = UserService.findById(userId);
		            if (user != null) {
		                request.setAttribute("userDetails", user);
		                RequestDispatcher dispatcher = request.getRequestDispatcher("/after_login_header.jsp");
		                dispatcher.forward(request, response);
		            } 
		        } else {
		            RequestDispatcher dispatcher = request.getRequestDispatcher("/before_login_header.jsp");
		            dispatcher.forward(request, response);
		        }
		    } catch (NumberFormatException e) {
		        e.printStackTrace(); 
		    } catch (ServiceException e) {
				e.printStackTrace();
			} catch (ValidationException e) {
				e.printStackTrace();
			} 
		
	}

}
