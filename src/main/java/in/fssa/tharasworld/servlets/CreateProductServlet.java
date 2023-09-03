	package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.ProductService;


/**
 * Servlet implementation class CreateProductServlet
 */
@WebServlet("/product/create")
public class CreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ProductDetailDTO product = new ProductDetailDTO();
		
		try {
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			System.out.println("Name cannot be null or empty");
		} else {
			product.setName(request.getParameter("name"));
		}
		
		System.out.println(product.toString());
		
		ProductService productService = new ProductService();
		productService.create(product);
		
		response.sendRedirect(request.getContextPath()+"/product_list");
		
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		
	}

}
