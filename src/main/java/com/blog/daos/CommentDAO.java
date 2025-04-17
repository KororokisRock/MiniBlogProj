package com.blog.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.models.Post;
import com.blog.models.User;
import com.blog.util.DatabaseUtil;
import com.blog.models.Comment;

public class CommentDAO {
	private Connection connection = null;
	private UserDAO userDAO = null;
	
	public CommentDAO() {
    	connection = DatabaseUtil.getConnection();
    	userDAO = new UserDAO();
    }

    public List<Comment> getAllCommentsToPost(int postId) {
    	List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE post_id = ? ORDER BY created_at DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setInt(1, postId);
        	ResultSet res = stmt.executeQuery();
        	while (res.next()) {
        		User author = userDAO.getUserByUserId(res.getInt("user_id"));
        		comments.add(new Comment(res.getInt("id"), res.getString("text"), res.getInt("user_id"), author.getUsername(), res.getInt("post_id"), res.getTimestamp("created_at").toLocalDateTime()));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return comments;
    }
    
    public void addCommentToPost(int userId, int postId, String text) {
    	String sql = "INSERT INTO comments(text, user_id, post_id) VALUES (?, ?, ?)";
    	try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setString(1, text);
        	stmt.setInt(2, userId);
        	stmt.setInt(3, postId);
        	stmt.executeUpdate();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
    }
    
    public void deleteCommentById(int commentId) {
    	String sql = "DELETE FROM comments WHERE id = ?";
    	try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setInt(1, commentId);
        	stmt.executeUpdate();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
    }
}
