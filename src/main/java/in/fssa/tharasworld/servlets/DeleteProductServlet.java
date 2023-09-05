package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.ProductEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/product/delete")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProductEntity product = new ProductEntity();
		
		try {
			
			ProductService productService = new ProductService();
			
			String idParams = request.getParameter("pdt_id");
			
			int id = Integer.parseInt(idParams);
			
			productService.delete(id); 
			
			response.sendRedirect(request.getContextPath() + "/product_list");
			
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}


}
