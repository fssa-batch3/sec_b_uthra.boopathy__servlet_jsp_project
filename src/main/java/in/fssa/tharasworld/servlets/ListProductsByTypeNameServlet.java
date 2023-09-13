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

/**
 * Servlet implementation class ListProductsByTypeName
 */
@WebServlet("/type/products")
public class ListProductsByTypeNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {
		
			String typeName = request.getParameter("search_type");
			
			try {
				Set<ProductDetailDTO> products = ProductService.findByTypeName(typeName);
				request.setAttribute("ListProductsByTypeName", products);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_type_name.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (ValidationException e) {
				e.printStackTrace();
			} 
			
	} else {
		try {
			int userId = userIdObject.intValue();
			User user = UserService.findById(userId);
			
			System.out.println(userId);

			String typeName = request.getParameter("search_type");
			
			Set<ProductDetailDTO> products = ProductService.findByTypeName(typeName);
			request.setAttribute("ListProductsByTypeName", products);
			request.setAttribute("userDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_type_name.jsp");
			dispatcher.forward(request, response);
			
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}		
			
	}

}
