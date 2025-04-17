package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import javax.servlet.http.HttpSession;

import com.blog.daos.PostDAO;
import com.blog.models.User;

@WebServlet("/posts/create")
public class CreatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO = null;

    public CreatePostServlet() {
        super();
        postDAO = new PostDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			request.getRequestDispatcher("/WEB-INF/createpost.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/notauthorisation.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if (title == null || title.trim().isEmpty()) {
			request.setAttribute("titleError", "Заголовок не может быть пустым");
            request.getRequestDispatcher("/WEB-INF/createpost.jsp").forward(request, response);
		} else if (content == null || content.trim().isEmpty()) {
			request.setAttribute("contentError", "Содержание не может быть пустым");
            request.getRequestDispatcher("/WEB-INF/createpost.jsp").forward(request, response);
		} else {
			postDAO.addPost(title, content, userId, LocalDateTime.now());
			response.sendRedirect(request.getContextPath() + "/posts");
		}
	}
}
