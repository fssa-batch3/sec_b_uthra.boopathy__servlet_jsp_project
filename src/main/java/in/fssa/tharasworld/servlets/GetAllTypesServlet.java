
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
import in.fssa.tharasworld.entity.CategoryEntity;
import in.fssa.tharasworld.entity.TypeEntity;
import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.PersistenceException;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.User;
import in.fssa.tharasworld.service.CategoryService;
import in.fssa.tharasworld.service.ProductService;
import in.fssa.tharasworld.service.TypeService;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;


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
		
		
		 HttpSession session = request.getSession();
		
		Integer userIdObject = (Integer) session.getAttribute("userId");
		if (userIdObject == null) {
			try {
				
				String categoryId = request.getParameter("category_id");
				
				Set<TypeEntity> types = TypeService.findAllTypesByCategoryId(Integer.parseInt(categoryId));
				request.setAttribute("types", types);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/type_list.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException | NumberFormatException | ValidationException | PersistenceException e) {
				Logger.error(e);
			} 
		} else {
			try {
				int userId = userIdObject.intValue();
				User user = UserService.findById(userId);

				String categoryId = request.getParameter("category_id");
				
				Set<TypeEntity> types = TypeService.findAllTypesByCategoryId(Integer.parseInt(categoryId));				
				request.setAttribute("types", types);
				request.setAttribute("userDetails", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/type_list.jsp");
				
				dispatcher.forward(request, response);
			} catch (ServiceException | NumberFormatException | ValidationException | PersistenceException e) {
				Logger.error(e);
			} 
		}

	}

}
