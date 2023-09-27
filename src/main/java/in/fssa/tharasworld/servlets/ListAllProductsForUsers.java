package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class ListAllProductsForUsers
 */
@WebServlet("/all_products")
public class ListAllProductsForUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");	
		
		if(userIdObject == null) {
			try {
				
				Set<ProductDetailDTO> product = ProductService.findAll();
				request.setAttribute("productList", product);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/productlist.jsp");
				dispatcher.forward(request, response);
				
			} catch (ServiceException e) {
				Logger.error(e);
			} 
			
		} else {
		
			int userId = userIdObject.intValue();
			
			UserEntity user;
			try {
				user = UserService.findById(userId);
				
				Set<ProductDetailDTO> product = ProductService.findAll();
				request.setAttribute("productList", product);
				request.setAttribute("userDetails", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/productlist.jsp");
				dispatcher.forward(request, response);
				
			} catch (ServiceException | ValidationException e) {
				Logger.error(e);
			} 
		}
		
	}


}
