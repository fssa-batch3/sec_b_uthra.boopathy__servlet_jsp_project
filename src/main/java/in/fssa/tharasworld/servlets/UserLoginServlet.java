package in.fssa.tharasworld.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import in.fssa.tharasworld.entity.UserEntity;
import in.fssa.tharasworld.exception.ServiceException;
import in.fssa.tharasworld.exception.ValidationException;
import in.fssa.tharasworld.service.UserService;
import in.fssa.tharasworld.util.Logger;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/user_login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		try {
			Long phoneNumber = Long.parseLong(request.getParameter("phone_number"));

			String password = request.getParameter("password");

			UserService userService = new UserService();
			UserEntity user = userService.checkUserExistsWithPhoneNumber(phoneNumber);

			if (user == null) {
				System.out.println("User not found");
			} else if (!BCrypt.checkpw(password, user.getPassword())) {
				System.out.println("Incorrect Phone number or Password:(");
				out.println("<script>alert('Incorrect Phone number or Password')</script>");
				out.println("<script>window.history.back();</script>");
			} else {
				int id = user.getId();
				System.out.println("Login Successfull:)");

				if (user.getRole().equalsIgnoreCase("seller")) {

					HttpSession session = request.getSession();

					session.setAttribute("userId", id);
					session.setAttribute("userDetails", user);
					response.sendRedirect(request.getContextPath() + "/product_list");

				} else {

					HttpSession session = request.getSession();

					session.setAttribute("userId", id);
					session.setAttribute("userDetails", user);
					response.sendRedirect(request.getContextPath() + "/category_list");

				}
			}

		} catch (Exception e) {

			/*
			 * PrintWriter outer = response.getWriter(); // Logger.error(e);
			 * outer.println("<script>alert('"+ e.getMessage() +"');</script>");
			 * //outer.println(e.getMessage());
			 * 
			 * 
			 * 
			 * 
			 * out.println("<script>window.history.back();</script>");
			 */
			Logger.error(e);
			System.out.println("getting catch");
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/user_login.jsp");
			
			rd.forward(request, response);
		}
	}

}
