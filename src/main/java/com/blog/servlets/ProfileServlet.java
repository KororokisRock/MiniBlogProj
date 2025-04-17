package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.daos.PostDAO;
import com.blog.daos.UserDAO;
import com.blog.models.User;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostDAO postDAO = null;
	UserDAO userDAO = null;
	
    public ProfileServlet() {
        super();
        postDAO = new PostDAO();
        userDAO = new UserDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			request.setAttribute("posts", postDAO.getAllPostsByUser(user.getId(), user.getUsername()));
			request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/notauthorisation.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			userDAO.deleteUser(((User) session.getAttribute("user")).getId());
			session.removeAttribute("user");
		}
		response.sendRedirect(request.getContextPath() + "/posts");
	}

}
