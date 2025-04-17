package com.blog.servlets;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.daos.PostDAO;
import com.blog.models.Post;
import com.blog.models.User;


@WebServlet("/posts/edit")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostDAO postDAO = null;

    public EditPostServlet() {
        super();
        postDAO = new PostDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int postId = Integer.parseInt(request.getParameter("id"));
			Post post = postDAO.getPostById(postId);
			if (post != null) {
				HttpSession session = request.getSession();
				if (post.getUserId() == ((User) session.getAttribute("user")).getId()) {
					request.setAttribute("post", post);
					request.getRequestDispatcher("/WEB-INF/editpost.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/posts");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/posts");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/posts");
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String postId = request.getParameter("postId");
		if (title == null || title.trim().isEmpty()) {
			Post post = postDAO.getPostById(Integer.parseInt(postId));
			request.setAttribute("post", post);
			request.setAttribute("titleError", "Заголовок не может быть пустым");
	        request.getRequestDispatcher("/WEB-INF/editpost.jsp").forward(request, response);
		} else if (content == null || content.trim().isEmpty()) {
			Post post = postDAO.getPostById(Integer.parseInt(postId));
			request.setAttribute("post", post);
			request.setAttribute("contentError", "Содержание не может быть пустым");
	        request.getRequestDispatcher("/WEB-INF/editpost.jsp").forward(request, response);
		} else {
			postDAO.editPost(Integer.parseInt(postId), title, content);
			response.sendRedirect(request.getContextPath() + "/posts");
		}
	}

}
