package com.blog.models;

import java.io.Serializable;
import java.time.LocalDateTime;

public class User implements Serializable {
    private int id;
    private String username;
    private String email;
    private String password;
    private String role;
    private LocalDateTime createdAt;
    
    public User() {
    	this.id = -1;
    	this.username = "";
    	this.email = "";
    	this.password = "";
    	this.role = "";
    	this.createdAt = LocalDateTime.of(1, 1, 1, 1, 1);
    }
    
    public User(int id, String username, String email, String password, String role, LocalDateTime createdAt) {
    	this.id = id;
    	this.username = username;
    	this.email = email;
    	this.password = password;
    	this.role = role;
    	this.createdAt = createdAt;
    }
    
    public int getId() {
    	return this.id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }
    
    public String getUsername() {
    	return this.username;
    }
    
    public void setUsername(String username) {
    	this.username = username;
    }
    
    public String getEmail() {
    	return this.email;
    }
    
    public void setEmail(String email) {
    	this.email = email;
    }
    
    public String getPassword() {
    	return this.password;
    }
    
    public void setPassword(String password) {
    	this.password = password;
    }
    
    public String getRole() {
    	return this.role;
    }
    
    public void setRole(String role) {
    	this.role = role;
    }
    
    public LocalDateTime getCreatedAt() {
    	return this.createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
    	this.createdAt = createdAt;
    }
}
