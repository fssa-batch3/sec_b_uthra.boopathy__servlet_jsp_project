package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mysql.cj.xdevapi.JsonParser;

import in.fssa.tharasworld.entity.OrderEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.OrderService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class CartBuyNowServlet
 */
@WebServlet("/cart_buy_now")
public class CartBuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
		
		HttpSession session = request.getSession();

		Integer userIdObject = (Integer) session.getAttribute("userId");

		 int userId = userIdObject.intValue();
	        OrderEntity order = new OrderEntity();

	        String jsonInput = request.getReader().lines().collect(Collectors.joining());

	        // Parse the received JSON object
	        JSONObject jsonObject = new JSONObject(jsonInput);
	        
	        // Extract the 'cart' array from the JSON object
	        JSONArray jsonArray = jsonObject.getJSONArray("cart");
	        
	        String getAddress = (String) jsonObject.get("userAddress");
	        
	        String getPhoneNumber = (String) jsonObject.get("phoneNumber");
	        
	        if(getAddress==null) {
	        	
	        	PrintWriter out = response.getWriter();
				out.println("<script>alert('You did not add any address')</script>");
				out.println("<script>window.history.back();</script>");
	        	
	        } else {

		        if(jsonArray!=null) {

			        // Iterate through the 'cart' array and create Account objects
			        for (int i = 0; i < jsonArray.length(); i++) {
			          
			        	JSONObject itemObject = jsonArray.getJSONObject(i);
			            
			        	int productQuantity = itemObject.getInt("product_quantity");
			            	            
			        	int sellerId = itemObject.getInt("seller_id");
			            
			        	int priceId = itemObject.getInt("price_id");
			            
			            order.setPhoneNumber(Long.parseLong(getPhoneNumber));

						order.setQuantity(productQuantity);

						order.setUserId(userId);

						order.setAddressId(Integer.parseInt(getAddress.trim()));

						order.setPriceId(priceId);

						order.setSellerId(sellerId);

			            OrderService orderService = new OrderService();
			            orderService.create(order);

			        }
			        
			        response.setStatus(HttpServletResponse.SC_OK);
			       
			        } else {

			        	Logger.info("error occured");
			        	
			        }

			}
	        
	} catch (ServiceException | ValidationException e) {

		Logger.error(e);
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>alert('"+e.getMessage()+"')</script>");
		out.println("<script>window.history.back();</script>");
		
	}
		
	}

}
