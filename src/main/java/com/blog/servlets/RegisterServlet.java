package com.blog.servlets;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.models.User;
import com.blog.daos.UserDAO;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		if (username != null && email != null && password1 != null && password2 != null) {
			if (password1.equals(password2)) {
				boolean existUserByEmail = userDAO.existUserByEmail(email);
				boolean existUserByUsername = userDAO.existUserByUsername(username);
				if (!existUserByUsername && !existUserByEmail) {
					userDAO.addUser(username, email, password1, "USER", LocalDateTime.now());
					request.getSession().setAttribute("user", userDAO.getUserByUsername(username));
					response.sendRedirect(request.getContextPath() + "/posts");
				} else {
					if (existUserByUsername) {
						request.setAttribute("error", "Пользователь с таким именем уже существует");
					} else {
						request.setAttribute("error", "Пользователь с такой почтой уже существует");
					}
		            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error", "Пароли не совпадают");
	            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("error", "Произошла ошибка, попробуйте еще раз.");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		}
	}
}
