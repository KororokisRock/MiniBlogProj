package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.daos.UserDAO;
import com.blog.models.User;
import com.blog.util.PasswordUtil;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username != null && password != null) {
			if (userDAO.existUserByUsername(username)) {
				User user = userDAO.getUserByUsername(username);
				if (PasswordUtil.matches(password, user.getPassword())) {
					request.getSession().setAttribute("user", user);
					response.sendRedirect(request.getContextPath() + "/posts");
				} else {
					request.setAttribute("error", "Неверный пароль");
		            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error", "Пользователь не найден");
	            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/posts");
		}
	}
}
