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
import in.fssa.tharasworld.entity.TypeEntity;
import in.fssa.tharasworld.exception.PersistenceException;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.User;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.TypeService;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class GetAllProductsByTypeServlet
 */
@WebServlet("/category/types/products")
public class GetAllProductsByTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {
				
				String typeId = request.getParameter("type_id");
				
				try {
					Set<ProductDetailDTO> products = ProductService.findByTypeId(Integer.parseInt(typeId));
					request.setAttribute("ListOfProductsByType", products);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_type.jsp");
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

				String typeId = request.getParameter("type_id");
				
				Set<ProductDetailDTO> products = ProductService.findByTypeId(Integer.parseInt(typeId));
				request.setAttribute("ListOfProductsByType", products);
				request.setAttribute("userDetails", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list_products_by_type.jsp");
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
