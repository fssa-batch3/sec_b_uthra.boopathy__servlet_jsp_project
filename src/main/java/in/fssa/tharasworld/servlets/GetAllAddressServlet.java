package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.AddressEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.AddressService;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class GetAllAddressServlet
 */
@WebServlet("/address")
public class GetAllAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		
		int userId = userIdObject.intValue();
		
		UserEntity user;
		
		try {
			
			user = UserService.findById(userId);
			
			AddressService addressService = new AddressService();
			
			List<AddressEntity> addressList = addressService.findAddressesByUserId(userId);
			
			AddressEntity address = AddressService.findByDefault(userId);
			
			request.setAttribute("defaultAddress", address);
			
			request.setAttribute("addressList", addressList);

			request.setAttribute("userDetails", user);
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("/list_all_address.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {
			
			e.printStackTrace();
		}
		
	}
	
}
