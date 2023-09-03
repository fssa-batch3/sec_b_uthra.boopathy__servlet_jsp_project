package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.CategoryEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.service.CategoryService;

/**
 * Servlet implementation class GetAllCategories
 */
@WebServlet("/category_list")
public class GetAllCategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Set<CategoryEntity> category = CategoryService.findAll();
			request.setAttribute("categoryList", category);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/category_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}


}
