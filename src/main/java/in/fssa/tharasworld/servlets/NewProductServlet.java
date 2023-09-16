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

/**
 * Servlet implementation class NewProductServlet
 */
@WebServlet("/product/new")
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");	
		
		
		try {
			
			int userId = userIdObject.intValue();
			
			UserEntity user = UserService.findById(userId);
			
			request.setAttribute("userDetails", user);
			
			RequestDispatcher rd = request.getRequestDispatcher("/add_product.jsp");
			
			rd.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {

			e.printStackTrace();
		
		}
	
	}


}
