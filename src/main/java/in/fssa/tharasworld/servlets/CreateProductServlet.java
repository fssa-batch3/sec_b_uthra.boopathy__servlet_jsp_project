	package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.dto.ProductDetailDTO;
import in.fssa.tharasworld.entity.PriceEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.User;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;


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
		
		
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		
		int userId = userIdObject.intValue();

		ProductDetailDTO product = new ProductDetailDTO();
		
		try {
			
			product.setImg(request.getParameter("img_url"));
		
		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
			Logger.info("Name cannot be null or empty");
		} else {
			product.setName(request.getParameter("name"));
		}
		
		product.setDescription(request.getParameter("description"));
		
		product.setTypeId(Integer.parseInt(request.getParameter("type")));
		
		product.setSellerId(userId);
		
		List<PriceEntity> prices = new ArrayList<>();
				
		PriceEntity price = new PriceEntity(); 
		
		double actualPrice = (Double.parseDouble(request.getParameter("actual_price")));
		
		double discount = Double.parseDouble(request.getParameter("discount"));
		
		price.setActualPrice(actualPrice);
		
		Double currenPrice = actualPrice -(actualPrice * discount)/100;
		
		price.setCurrentPrice(currenPrice);
		
		price.setDiscount(discount);
		
		prices.add(price);
		
		product.setListOfPrices(prices);
		
		ProductService productService = new ProductService();
		productService.create(product);
		
		response.sendRedirect(request.getContextPath()+"/product_list");
		
		} catch (ValidationException | ServiceException e) {
			Logger.error(e);
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/add_product.jsp");
			
			rd.forward(request, response);
		}
			
	}

}
