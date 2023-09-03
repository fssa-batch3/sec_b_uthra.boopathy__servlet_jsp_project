
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
import in.fssa.tharasworld.entity.TypeEntity;
import in.fssa.tharasworld.exception.PersistenceException;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.TypeService;


/**
 * Servlet implementation class GetAllTypes
 */
@WebServlet("/category/types")
public class GetAllTypesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String categoryId = request.getParameter("category_id");
		
		try {
			Set<TypeEntity> types = TypeService.findAllTypesByCategoryId(Integer.parseInt(categoryId));
			request.setAttribute("types", types);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/type_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (PersistenceException e) {
			e.printStackTrace();
		} 

	}

}
