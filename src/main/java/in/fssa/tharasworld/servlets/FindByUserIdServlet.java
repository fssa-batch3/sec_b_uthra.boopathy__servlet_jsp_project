package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
 * Servlet implementation class FindByUserIdServlet
 */
@WebServlet("/user/details")
public class FindByUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			HttpSession session = request.getSession();
			
			Integer userId = (Integer) session.getAttribute("userId");
			
			UserEntity user = UserService.findById(userId);
			
			AddressEntity address = AddressService.findByDefault(userId);
	   
			request.setAttribute("userDetails", user);
			request.setAttribute("address", address);
						
			RequestDispatcher dispatcher = request.getRequestDispatcher("/get_user_by_id.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
		}

	}


}
