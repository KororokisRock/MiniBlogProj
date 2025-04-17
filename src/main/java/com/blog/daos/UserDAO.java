package com.blog.daos;

import com.blog.models.User;
import com.blog.util.DatabaseUtil;
import com.blog.util.PasswordUtil;
import java.sql.*;
import java.time.LocalDateTime;


public class UserDAO {
    private Connection connection = null;
    
    public UserDAO() {
    	connection = DatabaseUtil.getConnection();
    }

    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setString(1, username);
        	ResultSet res = stmt.executeQuery();
        	if (res.next()) {
        		user = new User();
        		user.setId(res.getInt("id"));
        		user.setUsername(res.getString("username"));
        		user.setEmail(res.getString("email"));
        		user.setPassword(res.getString("password"));
        		user.setRole(res.getString("role"));
        		user.setCreatedAt(res.getTimestamp("created_at").toLocalDateTime());
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return user;
    }
    
    public User getUserByUserId(int userId) {
    	User user = null;
    	String sql = "SELECT * FROM users WHERE id = ?";
    	try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	stmt.setInt(1, userId);
        	ResultSet res = stmt.executeQuery();
        	if (res.next()) {
        		user = new User();
        		user.setId(res.getInt("id"));
        		user.setUsername(res.getString("username"));
        		user.setEmail(res.getString("email"));
        		user.setPassword(res.getString("password"));
        		user.setRole(res.getString("role"));
        		user.setCreatedAt(res.getTimestamp("created_at").toLocalDateTime());
        	}
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return user;
    }
    
    public boolean existUserByUsername(String username) {
    	String sql = "SELECT EXISTS( SELECT 1 from users WHERE username = ?) as exists_flag;";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setString(1, username);
    		ResultSet res = stmt.executeQuery();
    		if (res.next()) {
    			if (res.getInt("exists_flag") == 1) {
    				return true;
    			} else {
    				return false;
    			}
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    public boolean existUserByEmail(String email) {
    	String sql = "SELECT EXISTS( SELECT 1 from users WHERE email = ?) as exists_flag;";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setString(1, email);
    		ResultSet res = stmt.executeQuery();
    		if (res.next()) {
    			if (res.getInt("exists_flag") == 1) {
    				return true;
    			} else {
    				return false;
    			}
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    
    
    public void addUser(String username, String email, String password, String role, LocalDateTime createdAt) {
    	String sql = "INSERT INTO users (username, email, password, role, created_at) VALUES (?, ?, ?, ?, ?)";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setString(1, username);
    		stmt.setString(2, email);
    		stmt.setString(3, PasswordUtil.hash(password));
    		stmt.setString(4, role);
    		stmt.setTimestamp(5, Timestamp.valueOf(createdAt));
    		stmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public void deleteUser(int userId) {
    	String sql = "DELETE FROM users WHERE id = ?";
    	try(PreparedStatement stmt = connection.prepareStatement(sql)) {
    		stmt.setInt(1, userId);
    		stmt.executeUpdate();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
}
