<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Комментарии</title>
<style>
    :root {
        --primary-color: #4361ee;
        --secondary-color: #3f37c9;
        --accent-color: #4895ef;
        --light-color: #f8f9fa;
        --dark-color: #212529;
        --success-color: #4cc9f0;
        --danger-color: #f72585;
        --border-radius: 8px;
        --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        --transition: all 0.3s ease;
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        line-height: 1.6;
        color: var(--dark-color);
        background-color: #f5f7fa;
        margin: 0;
        padding: 20px;
    }
    
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .btn-back {
        display: inline-block;
        margin-bottom: 20px;
        padding: 8px 16px;
        background-color: var(--accent-color);
        color: white;
        text-decoration: none;
        border-radius: var(--border-radius);
        transition: var(--transition);
    }
    
    .btn-back:hover {
        background-color: var(--secondary-color);
        text-decoration: none;
    }
    
    .post-card {
        background-color: white;
        padding: 20px;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        margin-bottom: 30px;
    }
    
    .post-card h2 {
        color: var(--primary-color);
        margin-top: 0;
    }
    
    .post-card small {
        color: #6c757d;
        display: block;
        margin-top: 10px;
    }
    
    .comment-form {
        background-color: white;
        padding: 20px;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        margin-bottom: 30px;
    }
    
    .comment-form label {
        display: block;
        margin-bottom: 10px;
        font-weight: 500;
    }
    
    .comment-form textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: var(--border-radius);
        min-height: 100px;
        margin-bottom: 10px;
        font-family: inherit;
    }
    
    .comment-form button {
        background-color: var(--success-color);
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: var(--border-radius);
        cursor: pointer;
        transition: var(--transition);
    }
    
    .comment-form button:hover {
        background-color: #3aa8d8;
    }
    
    .error {
        color: var(--danger-color);
        display: block;
        margin-top: 5px;
    }
    
    .comment-list {
        margin-top: 30px;
    }
    
    .comment-card {
        background-color: white;
        padding: 15px;
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        margin-bottom: 15px;
        position: relative;
    }
    
    .comment-card h4 {
        margin-top: 0;
        color: var(--secondary-color);
    }
    
    .comment-card small {
        color: #6c757d;
        display: block;
        margin-top: 5px;
    }
    
    .comment-actions {
        margin-top: 10px;
    }
    
    .comment-actions button {
        background-color: var(--danger-color);
        color: white;
        padding: 5px 10px;
        border: none;
        border-radius: var(--border-radius);
        cursor: pointer;
        transition: var(--transition);
    }
    
    .comment-actions button:hover {
        background-color: #d1146a;
    }
    
    h2.section-title {
        color: var(--primary-color);
        border-bottom: 2px solid var(--accent-color);
        padding-bottom: 5px;
        margin-top: 30px;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <div class="container">
        <a href="/MiniBlogProj/posts" class="btn-back">← Назад к статьям</a>
        <c:if test="${not empty sessionScope.user}">
        	<a href="/MiniBlogProj/profile" class="btn-back">Перейти в профиль</a>
        </c:if>
        
        <div class="post-card">
            <h2>${post.title}</h2>
            <p>${post.content}</p>
            <small>👤 Автор: ${post.username} | 📅 ${post.createdAt}</small>
        </div>
        
        <h2 class="section-title">💬 Комментарии</h2>
        
        <c:if test="${not empty sessionScope.user}">
            <div class="comment-form">
                <form action="/MiniBlogProj/posts/comments" method="post">
                    <input type="hidden" name="userId" value="${sessionScope.user.id}">
                    <input type="hidden" name="postId" value="${post.id}">
                    <label for="content">Написать свой комментарий:</label>
                    <textarea id="content" name="content" required placeholder="Напишите свой комментарий..."></textarea>
                    <c:if test="${not empty contentError}">
                        <span class="error">${contentError}</span>
                    </c:if>
                    <button type="submit">📤 Опубликовать</button>
                </form>
            </div>
        </c:if>
        
        <div class="comment-list">
            <c:forEach items="${comments}" var="comment">
                <div class="comment-card">
                    <h4>👤 ${comment.username}</h4>
                    <p>${comment.text}</p>
                    <small>📅 ${comment.createdAt}</small>
                    
                    <c:if test="${comment.userId == sessionScope.user.id || sessionScope.user.role == 'ADMIN'}">
                        <div class="comment-actions">
                            <form action="/MiniBlogProj/posts/comments" method="post">
                                <input type="hidden" name="commentId" value="${comment.id}">
                                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                                <input type="hidden" name="postId" value="${post.id}">
                                <button type="submit">🗑️ Удалить</button>
                            </form>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
