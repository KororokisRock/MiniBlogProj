package com.blog.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.models.Comment;
import com.blog.models.Post;
import com.blog.models.User;
import com.blog.daos.CommentDAO;
import com.blog.daos.PostDAO;

@WebServlet("/posts/comments")
public class CommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostDAO postDAO = null;
	CommentDAO commentDAO = null;
    public CommentsServlet() {
        super();
        postDAO = new PostDAO();
        commentDAO = new CommentDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int postId = Integer.parseInt(request.getParameter("id"));
			Post post = postDAO.getPostById(postId);
			if (post != null) {
				List<Comment> comments = commentDAO.getAllCommentsToPost(postId);
				request.setAttribute("post", post);
				request.setAttribute("comments", comments);
				request.getRequestDispatcher("/WEB-INF/commentstopost.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/posts");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/posts");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int postId = Integer.parseInt(request.getParameter("postId"));
		if (request.getParameter("commentId" ) != null) {
			int commentId = Integer.parseInt(request.getParameter("commentId"));
			commentDAO.deleteCommentById(commentId);
		} else {
			String content = request.getParameter("content");
			commentDAO.addCommentToPost(userId, postId, content);
		}
		Post post = postDAO.getPostById(postId);
		if (post != null) {
			List<Comment> comments = commentDAO.getAllCommentsToPost(postId);
			request.setAttribute("post", post);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("/WEB-INF/commentstopost.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/posts");
		}
	}

}
