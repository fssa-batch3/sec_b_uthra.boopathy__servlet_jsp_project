package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import in.fssa.tharasworld.entity.PriceEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.AddressService;
import in.fssa.tharasworld.service.OrderService;
import in.fssa.tharasworld.service.PriceService;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class ViewOrderedProductsServlet
 */
@WebServlet("/ordered_products")
public class ViewOrderedProductsServlet extends HttpServlet {
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
			
//			System.out.println(userId);

			int orderId = (Integer) Integer.parseInt(request.getParameter("order_id"));
			
			System.out.println(orderId);
						
			OrderEntity order = OrderService.findOrderByOrderId(orderId);
			
			int pdtId = PriceService.findProductByPriceId(order.getPriceId());

			PriceEntity price = PriceService.findPriceByPriceId(order.getPriceId());
			
			ProductDetailDTO product = ProductService.findByProductId(pdtId);
			
			UserEntity seller = UserService.findById(product.getSellerId());
			
			request.setAttribute("userDetails", user);
			request.setAttribute("price", price);
			request.setAttribute("productDetail", product);
			request.setAttribute("order", order);
			request.setAttribute("seller", seller);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/ordered_products.jsp");
			dispatcher.forward(request, response);
		
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} 
		
	}

}
