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

/**
 * Servlet implementation class NewAddressServlet
 */
@WebServlet("/address/update")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserEntity user = new UserEntity();
		
		AddressEntity address = new AddressEntity();
		
		int userId=0;
		AddressEntity returnAddress = null;
		
		 int addressId = Integer.parseInt(request.getParameter("id"));
		 
		 System.out.println(addressId);
		
		try {
		
		HttpSession session = request.getSession();
		
		 userId = (Integer) session.getAttribute("userId");	
		 
		 	address.setAddressId(Integer.parseInt(request.getParameter("id")));
			
			address.setName(request.getParameter("name"));
			
			address.setAddress(request.getParameter("address"));	
			
			address.setState(request.getParameter("state"));
			
			address.setPincode(Integer.parseInt(request.getParameter("pincode")));
			
			address.setSetAsDefaultStatus(true);

			address.setUserId(userId);
		
		AddressService addressService = new AddressService();
		returnAddress = addressService.findByAddressId(addressId);
		
		addressService.update(addressId, address);
		
		response.sendRedirect(request.getContextPath()+"/address");
		
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			
			
			   
			request.setAttribute("editAddress", returnAddress);
			request.setAttribute("userId", userId);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/edit_user.jsp");
			dispatcher.forward(request, response);
			}
		
	}

}
