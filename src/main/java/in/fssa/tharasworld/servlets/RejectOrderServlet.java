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
import in.fssa.tharasworld.service.OrderService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class RejectOrderServlet
 */
@WebServlet("/reject_order")
public class RejectOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		
		try {
			int userId = userIdObject.intValue();
			UserEntity user = UserService.findById(userId);

			int orderId = (Integer) Integer.parseInt(request.getParameter("order_id"));
			
			 OrderService order = new OrderService();
			 order.cancelOrder(orderId);
			 
				 
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/seller_orderList");
					dispatcher.forward(request, response);

		
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
		} 
		
		
	}

}
