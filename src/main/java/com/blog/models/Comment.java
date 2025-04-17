package com.blog.models;

import java.time.LocalDateTime;
import java.io.Serializable;

public class Comment implements Serializable {
    private int id;
    private String text;
    private int userId;
    private String username;
    private int postId;
    private LocalDateTime createdAt;
    
    public Comment() {
    	this.id = -1;
    	this.text = "";
    	this.userId = -1;
    	this.username = "";
    	this.postId = -1;
    	this.createdAt = LocalDateTime.of(0, 0, 0, 0, 0, 0);
    }
    
    public Comment(int id, String text, int userId, String username, int postId, LocalDateTime createdAt) {
    	this.id = id;
    	this.text = text;
    	this.userId = userId;
    	this.username = username;
    	this.postId = postId;
    	this.createdAt = createdAt;
    }
    
    public int getId() {
    	return this.id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }
    
    public String getText() {
    	return this.text;
    }
    
    public void setText(String text) {
    	this.text = text;
    }
    
    public int getUserId() {
    	return this.userId;
    }
    
    public void setUserId(int userId) {
    	this.userId = userId;
    }
    
    public String getUsername() {
    	return this.username;
    }
    
    public void setUsername(String username) {
    	this.username = username;
    }
    
    public int getPostId() {
    	return this.postId;
    }
    
    public void setPostId(int postId) {
    	this.postId = postId;
    }
    
    public LocalDateTime getCreatedAt() {
    	return this.createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
    	this.createdAt = createdAt;
    }
}
