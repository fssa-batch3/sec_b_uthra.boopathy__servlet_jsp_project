package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.entity.AddressEntity;
import in.fssa.tharasworld.entity.OrderEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.AddressService;
import in.fssa.tharasworld.service.OrderService;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class BuyNowServlet
 */
@WebServlet("/products/buy_now")
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {

			out.println("<script>alert('You are not logged in! Please login to buy products')</script>");
			out.println("<script>window.history.back();</script>");

		} else {
			
			try {
				
				int userId = userIdObject.intValue();
				UserEntity user = UserService.findById(userId);
				
				String productId = request.getParameter("pdt_id");

				ProductDetailDTO product = ProductService.findByProductId(Integer.parseInt(productId));

				AddressEntity address = AddressService.findByDefault(userId);
				
				if(address!=null) {

					request.setAttribute("productDetails", product);
					request.setAttribute("address", address);
					request.setAttribute("userDetails", user);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/buy_now.jsp");
					dispatcher.forward(request, response);

				} else {
					
					out.println("<script>alert('You did not add any address')</script>");
					out.println("<script>window.history.back();</script>");
					
				}
				
			} catch (ServiceException | ValidationException e) {
				
				Logger.error(e);
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			OrderEntity order = new OrderEntity();

			HttpSession session = request.getSession();

			Integer userIdObject = (Integer) session.getAttribute("userId");

			int userId = userIdObject.intValue();

			order.setPhoneNumber(Long.parseLong(request.getParameter("phoneNumber")));

			order.setQuantity(Integer.parseInt(request.getParameter("quantity")));

			order.setUserId(userId);

			order.setAddressId(Integer.parseInt(request.getParameter("addressId")));

			order.setPriceId(Integer.parseInt(request.getParameter("priceId")));

			order.setSellerId(Integer.parseInt(request.getParameter("sellerId")));

			OrderService orderService = new OrderService();

			orderService.create(order);

			response.sendRedirect(request.getContextPath() + "/category_list");

		} catch (ServiceException | ValidationException e) {

			Logger.error(e);
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('"+e.getMessage()+"')</script>");
			out.println("<script>window.history.back();</script>");
 		
		}

	}

}
