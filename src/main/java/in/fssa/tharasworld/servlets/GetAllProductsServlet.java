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
import in.fssa.tharasworld.entity.CategoryEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.CategoryService;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;


/**
 * Servlet implementation class GetAllProductsServlet
 */
@WebServlet("/product_list")
public class GetAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");		
		
	if(userIdObject == null) {
			
			try {
				Set<CategoryEntity> category = CategoryService.findAll();
				request.setAttribute("categoryList", category);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/category_list.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				Logger.error(e);
			}
			
		} else {
		
		
		try {
			
			int userId = userIdObject.intValue();
			
			UserEntity user = UserService.findById(userId);
			
			Set<ProductDetailDTO> product = ProductService.findAllProductsBySellerId(userId);
			request.setAttribute("productList", product);
			request.setAttribute("userDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/product_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
		}
		
		}		
		
	}

}
