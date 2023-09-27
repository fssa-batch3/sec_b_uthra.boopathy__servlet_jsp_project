package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.AddressEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.AddressService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class DefaultAddressServlet
 */
@WebServlet("/address/set_as_default")
public class DefaultAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AddressEntity address = new AddressEntity();
		
		try {
			
			Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
			
			int userId = userIdObject.intValue();
			
				AddressService addressService = new AddressService();

				
			int addressId = (Integer) Integer.parseInt(request.getParameter("address_id"));
			
			addressService.setAsDefaultAddress(userId, addressId);
			
			response.sendRedirect(request.getContextPath() + "/address");
			
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
		} 
		
		
	}

}
