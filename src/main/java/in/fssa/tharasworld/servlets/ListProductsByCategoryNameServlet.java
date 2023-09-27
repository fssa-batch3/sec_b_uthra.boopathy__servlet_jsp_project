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
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.User;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class ListProductsByCategoryNameServlet
 */
@WebServlet("/category/products")
public class ListProductsByCategoryNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {
		
			String categoryName = request.getParameter("search");
			
			try {
				Set<ProductDetailDTO> products = ProductService.findByCategoryName(categoryName);
				request.setAttribute("ListProductsByCategoryName", products);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_category_name.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException | ValidationException e) {
				Logger.error(e);
			} 
			
	} else {
		try {
			int userId = userIdObject.intValue();
			User user = UserService.findById(userId);

			String categoryName = request.getParameter("search");
			
			Set<ProductDetailDTO> products = ProductService.findByCategoryName(categoryName);
			request.setAttribute("ListProductsByCategoryName", products);
			request.setAttribute("userDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_category_name.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
		} 
	}		
			
	}


}
