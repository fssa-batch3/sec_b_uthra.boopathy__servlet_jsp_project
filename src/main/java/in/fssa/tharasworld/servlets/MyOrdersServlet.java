package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.*;

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
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class MyOrdersServlet
 */
@WebServlet("/orders")
public class MyOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession(false);
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		
		try {
			int userId = userIdObject.intValue();
			UserEntity user = UserService.findById(userId);

			List<OrderEntity> order = OrderService.findOrdersByUserId(userId);
			
			List<PriceEntity> priceList = new ArrayList<>();
			
			for(OrderEntity p : order) {
								
				PriceEntity price = PriceService.findPriceByPriceId(p.getPriceId());
				
				priceList.add(price);
			}
			
			
			List<AddressEntity> addressList = new ArrayList<>();
			
			for(OrderEntity s : order) {
				int addressId = OrderService.findAddressByOrderId(s.getOrderId());
				
				AddressEntity address = AddressService.findByAddressId(addressId);
				
				addressList.add(address);
			}
			
			List<ProductDetailDTO> productList = new ArrayList<>();
			
			for(OrderEntity p : order) {
				int priceId = PriceService.findProductByPriceId(p.getPriceId());
				
				ProductDetailDTO product = ProductService.findByProductId(priceId);
								
				productList.add(product);
			}
			
			
			request.setAttribute("userDetails", user);
			request.setAttribute("productList", productList);
			request.setAttribute("price", priceList);
			request.setAttribute("addressList", addressList);
			request.setAttribute("orderList", order);


			RequestDispatcher dispatcher = request.getRequestDispatcher("/my_orders.jsp");
			dispatcher.forward(request, response);
		
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
		} 
		
	}


}
