package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
 * Servlet implementation class SellerOrderListServlet
 */
@WebServlet("/seller_orderList")
public class SellerOrderListServlet extends HttpServlet {
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
			
			System.out.println(userId);

			List<OrderEntity> order = OrderService.findOrdersBySellerId(userId);
			
//			System.out.println(order);
			
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
			request.setAttribute("addressList", addressList);
			request.setAttribute("orderList", order);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/seller_order_list.jsp");
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
