package com.blog.daos;

import com.blog.models.Post;
import com.blog.models.User;

import java.sql.*;
import java.time.LocalDateTime;

import com.blog.util.DatabaseUtil;
import com.blog.util.PasswordUtil;
import com.blog.daos.UserDAO;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private Connection connection = null;
    private UserDAO userDAO = null;
    
    public PostDAO() {
    	connection = DatabaseUtil.getConnection();
    	userDAO = new UserDAO();
    }

    public List<Post> getAllPosts() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts ORDER BY created_at DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	ResultSet res = stmt.executeQuery();
        	while (res.next()) {
        		User author = userDAO.getUserByUserId(res.getInt("user_id"));
        		posts.add(new Post(res.getInt("id"), res.getString("title"), res.getString("content"), author.getId(), author.getUsername(), res.getTimestamp("created_at").toLocalDateTime()));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return posts;
    }
    
    public Post getPostById(int postId) {
    	Post post = null;
    	String sql = "SELECT * FROM posts WHERE id = ?";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setInt(1, postId);
    		ResultSet res = stmt.executeQuery();
    		if (res.next() ) {
    			User author = userDAO.getUserByUserId(res.getInt("user_id"));
    			post = new Post(res.getInt("id"), res.getString("title"), res.getString("content"), author.getId(), author.getUsername(), res.getTimestamp("created_at").toLocalDateTime());
    		}
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return post;
    }
    
    public List<Post> getAllPostsByUser(int userId, String username) {
    	List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE user_id = ? ORDER BY created_at DESC";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setInt(1, userId);
        	ResultSet res = stmt.executeQuery();
        	while (res.next()) {
        		posts.add(new Post(res.getInt("id"), res.getString("title"), res.getString("content"), userId, username, res.getTimestamp("created_at").toLocalDateTime()));
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return posts;
    } 
    
    public void addPost(String title, String content, int userId, LocalDateTime createdAt) {
    	String sql = "INSERT INTO posts (title, content, user_id, created_at) VALUES (?, ?, ?, ?)";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setString(1, title);
    		stmt.setString(2, content);
    		stmt.setInt(3, userId);
    		stmt.setTimestamp(4, Timestamp.valueOf(createdAt));
    		stmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public void editPost(int postId, String newTitle, String newContent) {
    	String sql = "UPDATE posts SET title = ?, content = ? WHERE id = ?";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setString(1, newTitle);
    		stmt.setString(2, newContent);
    		stmt.setInt(3, postId);
    		stmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public void deletePostById(int postId) {
    	String sql = "DELETE FROM posts WHERE id = ?";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setInt(1, postId);
    		stmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
}
