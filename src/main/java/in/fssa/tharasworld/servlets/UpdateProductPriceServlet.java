package in.fssa.tharasworld.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.entity.PriceEntity;
import in.fssa.tharasworld.entity.ProductEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.PriceService;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class UpdateProductPriceServlet
 */
@WebServlet("/product/update_price")
public class UpdateProductPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PriceEntity price = new PriceEntity();
		
		int id = 0;
		
		ProductDetailDTO product = null;
		
		try {
			
			price.setActualPrice(Double.parseDouble(request.getParameter("actual_price")));
			
			Double currentPrice = Double.parseDouble(request.getParameter("actual_price"))-(Double.parseDouble(request.getParameter("actual_price")) * Double.parseDouble(request.getParameter("discount")))/100;
			
			price.setCurrentPrice(currentPrice);
			
			price.setDiscount(Double.parseDouble(request.getParameter("discount")));
		
		PriceService priceService = new PriceService();
		
		String idParams = request.getParameter("pdt_id");
		
		id = Integer.parseInt(idParams);
		
		product = ProductService.findByProductId(id);
		
		request.setAttribute("editProductPrice", product);
		
		priceService.update(id, price);
		
		response.sendRedirect(request.getContextPath()+"/product_list");
		
		} catch (ValidationException | ServiceException e) {

			Logger.error(e);
			
			request.setAttribute("errorMessage", e.getMessage());
			
			request.setAttribute("editProductPrice", product);
			
			request.setAttribute("pdtId", id);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/edit_product_price.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
