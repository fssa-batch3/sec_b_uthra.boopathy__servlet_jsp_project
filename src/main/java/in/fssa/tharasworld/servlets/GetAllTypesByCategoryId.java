package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.tharasworld.entity.TypeEntity;
import in.fssa.tharasworld.exception.PersistenceException;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.model.ResponseEntity;
import in.fssa.tharasworld.service.TypeService;

/**
 * Servlet implementation class GetAllTypesByCategoryId
 */
@WebServlet("/get_all_types_by_category_id")
public class GetAllTypesByCategoryId extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		System.out.println("Get all types by category id");

		Set<TypeEntity> types;
		try {
			types = TypeService.findAllTypesByCategoryId(5);
			
			ResponseEntity responseObject = new ResponseEntity();
			responseObject.setStatusCode(200);
			responseObject.setData(types);
			responseObject.setMessage("Product retrieved successfully");
			
			Gson gson = new Gson();
			String repsoneJson = gson.toJson(responseObject);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(repsoneJson);
		} catch (ServiceException | ValidationException | PersistenceException e) {
			e.printStackTrace();
		}
		
//		List<String> products = Arrays.asList("Pencil", "Pen", "Note", "Book");

//		ResponseEntity responseObject = new ResponseEntity();
//		responseObject.setStatusCode(200);
//		responseObject.setData(types);
//		responseObject.setMessage("Product retrieved successfully");
//		
//		Gson gson = new Gson();
//		String repsoneJson = gson.toJson(responseObject);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(repsoneJson);
		
	}


}
