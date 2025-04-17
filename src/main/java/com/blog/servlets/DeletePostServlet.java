package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.daos.PostDAO;

@WebServlet("/posts/delete")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostDAO postDAO = null;

    public DeletePostServlet() {
        super();
        postDAO = new PostDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/posts");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("postId") != null) {
			int postId = Integer.parseInt(request.getParameter("postId"));
			postDAO.deletePostById(postId);
		}
		response.sendRedirect(request.getContextPath() + "/posts");
	}
}
