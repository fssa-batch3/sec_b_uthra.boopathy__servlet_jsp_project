package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.User;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;


/**
 * Servlet implementation class FindByProductId
 */
@WebServlet({"/category/types/products/details"})
public class FindByProductIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		
		HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {
				
			String productId = request.getParameter("pdt_id");
				
			try {
				ProductDetailDTO product = ProductService.findByProductId(Integer.parseInt(productId));
				request.setAttribute("productDetails", product);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/find_by_product_id.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException | NumberFormatException | ValidationException e) {
				Logger.error(e);
			} 
				
		} else {
			try {
				int userId = userIdObject.intValue();
				UserEntity user = UserService.findById(userId);
				
				String productId = request.getParameter("pdt_id");
				
				ProductDetailDTO product = ProductService.findByProductId(Integer.parseInt(productId));
				request.setAttribute("productDetails", product);
				request.setAttribute("userId", userIdObject);
				request.setAttribute("userDetails", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/find_by_product_id.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException | NumberFormatException | ValidationException e) {
				Logger.error(e);
			} 
		}

	}


}
