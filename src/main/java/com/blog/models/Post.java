package com.blog.models;

import java.time.LocalDateTime;
import java.io.Serializable;

public class Post implements Serializable {
    private int id;
    private String title;
    private String content;
    private int userId;
    private String username;
    private LocalDateTime createdAt;
    
    public Post() {
    	this.id = -1;
    	this.title = "";
    	this.content = "";
    	this.userId = -1;
    	this.createdAt = LocalDateTime.of(0, 0, 0, 0, 0, 0);
    }
    
    public Post(int id, String title, String content, int userId, String username, LocalDateTime time) {
    	this.id = id;
    	this.title = title;
    	this.content = content;
    	this.userId = userId;
    	this.username = username;
    	this.createdAt = time;
    }
    
    public int getId() {
    	return this.id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }
    
    public String getTitle() {
    	return this.title;
    }
    
    public void setTitle(String title) {
    	this.title = title;
    }
    
    public String getContent() {
    	return this.content;
    }
    
    public void setContent(String content) {
    	this.content = content;
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
    
    public LocalDateTime getCreatedAt() {
    	return this.createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
    	this.createdAt = createdAt;
    }
}
