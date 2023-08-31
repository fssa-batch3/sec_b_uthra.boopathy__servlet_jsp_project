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
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.service.ProductService;


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

		try {
			Set<ProductDetailDTO> product = ProductService.findAll();
			request.setAttribute("productList", product);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/product_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		
	}

}
