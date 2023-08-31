package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/user_records")
public class GetAllUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		UserService userService = new UserService();
//		Set<UserEntity> userList;
//		
//		PrintWriter out = response.getWriter();
//		
//		try {
//			userList = userService.findAll();
////			System.out.println(userList);
//			out.print(userList);
//		} catch (ServiceException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
		try {
			
			Set<UserEntity> user = UserService.findAll();
			
			request.setAttribute("userList", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/user_records.jsp");
			dispatcher.forward(request, response);
		
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		
//		RequestDispatcher rd = request.getRequestDispatcher("user_records.jsp");
//		
//		rd.forward(request, response);
		
	}

}
