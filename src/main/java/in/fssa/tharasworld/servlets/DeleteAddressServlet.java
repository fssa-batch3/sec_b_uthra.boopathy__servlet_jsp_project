package in.fssa.tharasworld.servlets;

import java.io.IOException;
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
 * Servlet implementation class DeleteAddressServlet
 */
@WebServlet("/address/delete")
public class DeleteAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AddressEntity address = new AddressEntity();
		
		try {
			
			AddressService addressService = new AddressService();
				
			int addressId = (Integer) Integer.parseInt(request.getParameter("address_id"));
			
			addressService.delete(addressId); 
			
			response.sendRedirect(request.getContextPath() + "/address");
			
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
		} 
		
		
	}


}
