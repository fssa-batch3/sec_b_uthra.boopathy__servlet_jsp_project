package in.fssa.tharasworld.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.PriceEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.PriceService;

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
		
		try {
			
			price.setActualPrice(Double.parseDouble(request.getParameter("actual_price")));
			
			price.setCurrentPrice(Double.parseDouble(request.getParameter("current_price")));
			
			price.setDiscount(Double.parseDouble(request.getParameter("discount")));
			
//			product.setImg(request.getParameter("img_url"));
//		
//		if(request.getParameter("name") == null || request.getParameter("name").isEmpty()) {
//			System.out.println("Name cannot be null or empty");
//		} else {
//			product.setName(request.getParameter("name"));
//		}
//		
//
//		if(request.getParameter("description") == null || request.getParameter("description").isEmpty()) {
//			System.out.println("Description cannot be null or empty");
//		} else {
//			product.setDescription(request.getParameter("description"));
//		}
//		
//		String typeId = request.getParameter("type");
//		
//		product.setTypeId(Integer.parseInt(typeId));
		
		PriceService priceService = new PriceService();
		
		String idParams = request.getParameter("pdt_id");
		
		int id = Integer.parseInt(idParams);
		
		priceService.update(id, price);
		
		response.sendRedirect(request.getContextPath()+"/product_list");
		
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}

}
