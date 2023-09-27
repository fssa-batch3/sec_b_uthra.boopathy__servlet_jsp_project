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
 * Servlet implementation class CreateAddressServlet
 */
@WebServlet("/address/create")
public class CreateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AddressEntity address = new AddressEntity();
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			address.setName(request.getParameter("name"));
		}
		
		if(request.getParameter("address") == null || request.getParameter("address").isEmpty()) {
			Logger.info("Address cannot be null or empty");
		} else {
			address.setAddress(request.getParameter("address"));
		}
		
		if(request.getParameter("state") == null || request.getParameter("state").isEmpty()) {
			Logger.info("Address cannot be null or empty");
		} else {
			address.setState(request.getParameter("state"));
		}

			address.setPincode(Integer.parseInt(request.getParameter("pincode")));
			
			address.setUserId(userId);
	
		AddressService addressService = new AddressService();
		addressService.create(address);
		
		response.sendRedirect(request.getContextPath()+"/address");
		
		} catch (ValidationException | ServiceException e) {

			Logger.error(e);

			request.setAttribute("errorMessage", e.getMessage());
			
			RequestDispatcher rd = request.getRequestDispatcher("/add_address.jsp");
			
			rd.forward(request, response);
		}
		
	}

}
